import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //List<Article> listArticles = await getArticles();
    //Dès qu'on les 10 articles, on affiche la page d'acceuil

    //getArticles();

    //getArticlesList();

    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) {
    //     return HomePage(articles: listArticles);
    //   },
    // ));
  }

  // void getArticlesList() async {
  //   await ArticlesData().updateArticlesList();
  //   Navigator.pushReplacement(context, MaterialPageRoute(
  //     builder: (context) {
  //       return HomePage(articles: ArticlesData().articles);
  //     },
  //   ));
  // }

  // //On va chercher les 10 premiers articles
  // void getArticles() async {
  //   http.Response response = await http.get(kFirst10PostUrl);
  //   List<Article> articleList = new List();
  //   if (response.statusCode == 200) {
  //     List<dynamic> body = jsonDecode(response.body);
  //     articleList = body.map((dynamic item) => Article.fromJson(item)).toList();

  //     //on va aller chercher les images des articles via un autre API Call
  //     for (Article article in articleList) {
  //       int imageID = article.getImageID();
  //       String imageApiUrl =
  //           "http://lesoirdebko.ml/wp-json/wp/v2/media/$imageID?_fields=link";
  //       http.Response res = await http.get(imageApiUrl);
  //       if (res.statusCode == 200) {
  //         String data = res.body;
  //         article.imageUrl = jsonDecode(data)["link"];
  //       } else {
  //         print(
  //             "imageApiUrl URL FAILED !! response.statusCode == ${response.statusCode}");
  //         article.imageUrl = null;
  //       }
  //     }
  //     Navigator.pushReplacement(context, MaterialPageRoute(
  //       builder: (context) {
  //         return HomePage(articles: articleList);
  //       },
  //     ));
  //   } else {
  //     print("POST URL FAILED !! response.statusCode == ${response.statusCode}");
  //     throw ('Request failed with status: ${response.statusCode}.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "LE SOIR DE BAMAKO",
              style: GoogleFonts.permanentMarker(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
