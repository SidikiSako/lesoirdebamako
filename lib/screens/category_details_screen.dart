import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/model/category.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nouvel_horizon_app/widget/articles_list_widget.dart';
import 'package:nouvel_horizon_app/widget/category_articles_list_widget.dart';

class ArticlesPerCategory extends StatefulWidget {
  final Category category;
  ArticlesPerCategory({this.category});
  @override
  _ArticlesPerCategoryState createState() => _ArticlesPerCategoryState();
}

class _ArticlesPerCategoryState extends State<ArticlesPerCategory> {
  int pageNum = 1;
  bool hasArticles = true;
  List<Article> articles = new List();
  ScrollController _scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
    if (hasArticles) {
      getArticles();
    }
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            widget.category.name,
            style: GoogleFonts.permanentMarker(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
        body: articles.length >= 10 || hasArticles == false
            ? ListOfArticlesPerCategoryID(
                hasArticles: hasArticles,
                listArticles: articles,
                scrollController: _scrollController,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Un petit moment...",
                      style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ));
  }

  getArticles() async {
    print("getArticles just started with aticles.length = ${articles.length}");
    List<Article> articleList = new List();

    String categoryPostUrl =
        "http://lesoirdebko.ml/wp-json/wp/v2/posts?_embed=wp:featuredmedia,author&categories=${widget.category.categoryID}&page=${pageNum}&_fields=id,title,excerpt,content,featured_media,_links,modified";

    //premier API call
    http.Response response = await http.get(categoryPostUrl);

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
