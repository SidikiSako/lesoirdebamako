import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingData {
  //List<Article> articles = new List();
  int pageNumber = 1;
  bool hasArticles = true;

//recupère la liste des articles sur le blog
  getArticles(List<Article> articles) async {
    if (hasArticles) {
      String postUrl =
          "http://lesoirdebko.ml/wp-json/wp/v2/posts?page=${pageNumber}&_fields=id,title,excerpt,content,featured_media,_links";

      //premier API call
      http.Response response = await http.get(postUrl);

      if (response.statusCode == 200) {
        //print("POST URL IS OK ==> response.statusCode == 200");
        List<dynamic> body = jsonDecode(response.body);

        List<Article> articleList =
            body.map((dynamic item) => Article.fromJson(item)).toList();

        //On va aller chercher les images des articles avec un autre API call

      } else {
        print(
            "POST URL FAILED !! response.statusCode == ${response.statusCode}");
        throw ('Request failed with status: ${response.statusCode}.');
      }
      print("getArticles just ended with aticles.length = ${articles.length}");
    }
  }
}
