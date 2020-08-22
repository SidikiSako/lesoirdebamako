import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';

import 'package:http/http.dart' as http;
import 'package:nouvel_horizon_app/screens/loading_screen.dart';

import 'package:nouvel_horizon_app/widget/articles_list_widget.dart';
import 'package:nouvel_horizon_app/widget/category_list_widget.dart';
import 'dart:convert';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:nouvel_horizon_app/widget/saved_articles_widget.dart';
import 'package:nouvel_horizon_app/widget/subscribe_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = new List();
  int pageNum = 1;
  bool hasArticles = true;
  ScrollController _scrollController = new ScrollController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    getArticles();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //on fetch les données de la page suivante
        //en verifiant bien qu'il y a encore des pages
        //print(_scrollController.position.maxScrollExtent);
        getArticles();
      }
    });
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); //si on va sur une autre page, on efface la ressource
    //je ne suis pas sûr que ce soit ce que je veux car je veux pouvoir cliquer sur un article
    //puis revenir à la liste des articles sans perdre le contenu de ma liste.
    super.dispose();
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return articles.length < 10
        ? LoadingScreen()
        : DefaultTabController(
            length: 8,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                title: Text(
                  'lesoir de bamako',
                  style: GoogleFonts.permanentMarker(
                    color: Colors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              body: <Widget>[
                ArticleListWidget(
                  hasArticles: hasArticles,
                  listArticles: articles,
                  scrollController: _scrollController,
                ),
                CategoryList(),
                SavedArticle(),
                SubscribePage(),
              ][currentIndex],
              bottomNavigationBar: BubbleBottomBar(
                opacity: .1,
                currentIndex: currentIndex,
                onTap: changePage,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                elevation: 8,
                hasNotch: true, //new
                hasInk: true, //new, gives a cute ink effect
                inkColor: Colors
                    .black12, //optional, uses theme color if not specified
                items: <BubbleBottomBarItem>[
                  BubbleBottomBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      title: Text("Accueil")),
                  BubbleBottomBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        Icons.dashboard,
                        color: Colors.black,
                      ),
                      title: Text("Categories")),
                  BubbleBottomBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        Icons.bookmark_border,
                        color: Colors.black,
                      ),
                      title: Text("Enregistré")),
                  BubbleBottomBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(
                        Icons.import_contacts,
                        color: Colors.black,
                      ),
                      activeIcon: Icon(
                        Icons.import_contacts,
                        color: Colors.black,
                      ),
                      title: Text("S'abonner"))
                ],
              ),
            ),
          );
  }

  // getArticles() async {
  //   print("getArticles just started with aticles.length = ${articles.length}");

  //   String postUrl =
  //       "http://lesoirdebko.ml/wp-json/wp/v2/posts?_embed=wp:featuredmedia&page=${pageNum}&_fields=id,title,excerpt,content,featured_media,_links";

  //   //premier API call
  //   http.Response response = await http.get(postUrl);

  //   if (response.statusCode == 200) {
  //     print("POST URL IS OK ==> response.statusCode == 200");
  //     List<dynamic> body = jsonDecode(response.body);

  //     List<Article> articleList =
  //         body.map((dynamic item) => Article.fromJson(item)).toList();
  //     //on ajoute toList parce map renvoie un itterable

  //     //On va aller chercher les images des articles avec un autre API call
  //     for (int i = 0; i < articleList.length; i++) {
  //       int imageID = articleList[i].getImageID();
  //       String imageApiUrl =
  //           "http://lesoirdebko.ml/wp-json/wp/v2/media/$imageID?_fields=link";
  //       //print("imageApiURL = $imageApiUrl");
  //       http.Response res = await http.get(imageApiUrl);
  //       if (res.statusCode == 200) {
  //         String data = res.body;
  //         articleList[i].imageUrl = jsonDecode(data)["link"];
  //       } else {
  //         //print("imageApiUrl URL FAILED !! response.statusCode == ${response.statusCode}");
  //         // print(
  //         //     "ECHEC DE LA REQUETTE : http://lesoirdebko.ml/wp-json/wp/v2/media/${imageID}?_fields=link");
  //         // print("response.statusCode == ${res.statusCode}");
  //         //je met postImageUrl à null et pendant l'affichage dans main_page
  //         //si il est null, j'affiche le logo, sinon networkImage
  //         articleList[i].imageUrl = null;
  //         //throw ('Request failed with status: ${res.statusCode}.');
  //       }
  //       if (articleList.length % 10 == 0) {
  //         pageNum++;
  //       } else {
  //         hasArticles = false; // il n'y a plus d'articles
  //       }
  //       //on fait setState quand on ajoute le dernier article à la liste
  //       if (i == articleList.length - 1) {
  //         setState(() {
  //           print("ajout article N° $i");
  //           articles.add(articleList[i]);
  //         });
  //       } else {
  //         print("ajout article N° $i");
  //         articles.add(articleList[i]);
  //         //articleList.removeLast();
  //       }
  //       //on verifie s'il reste d'autres pages avec des articles
  //       //si on a pu récupéré 10 articles sur une page, ça veut dire qu'il y a
  //       //d'autres pages
  //       //Ce n'est pas vrai si le nombre d'articles divisé par 10 vaut 0
  //       //Par exemple : si on 50 artciles, après la 5è page, on peut penser qu'il
  //       // y a une autre page

  //     }
  //     //return articles;

  //   } else {
  //     print("POST URL FAILED !! response.statusCode == ${response.statusCode}");
  //     throw ('Request failed with status: ${response.statusCode}.');
  //   }
  //   print("getArticles just ended with aticles.length = ${articles.length}");
  // }

  getArticles() async {
    print("getArticles just started with aticles.length = ${articles.length}");
    List<Article> articleList = new List();

    String postUrl =
        "http://lesoirdebko.ml/wp-json/wp/v2/posts?_embed=wp:featuredmedia&page=${pageNum}&_fields=id,title,excerpt,content,featured_media,_links";

    //premier API call
    http.Response response = await http.get(postUrl);

    if (response.statusCode == 200) {
      print("POST URL IS OK ==> response.statusCode == 200");

      List<dynamic> body = jsonDecode(response.body);
      for (dynamic item in body) {
        try {
          Article a = Article.fromJson(item);
          articleList.add(a);
        } catch (e) {
          Article a = Article.fromJson2(item);
          articleList.add(a);
          print("Ce article n'a pas d'image : imageUrl = ${a.imageUrl}");
        }
      }
      // List<Article> articleList = body.map((dynamic item) {
      //   Article.fromJson(item).toList();
      // });

      if (articleList.length % 10 == 0) {
        //il reste des pages
        pageNum++;
      } else {
        hasArticles = false;
        // il n'y a plus d'articles
      }

      for (int i = 0; i < articleList.length; i++) {
        if (i == articleList.length - 1) {
          //on fait setState seulement après l'ajout du dernier article
          setState(() {
            print("ajout article N° $i");
            articles.add(articleList[i]);
          });
        } else {
          print("ajout article N° $i");
          articles.add(articleList[i]);
          //articleList.removeLast();
        }
      }

      //on ajoute toList parce map renvoie un itterable

      //On va aller chercher les images des articles avec un autre API call

    } else {
      print("POST URL FAILED !! response.statusCode == ${response.statusCode}");
      throw ('Request failed with status: ${response.statusCode}.');
    }
    print("getArticles just ended with aticles.length = ${articles.length}");
  }
}
