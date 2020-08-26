import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
//import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/screens/article_details_screen.dart';
import 'package:flutter_html/flutter_html.dart';

class MainArticle extends StatefulWidget {
  //article ou id de l'article pour initialiser les champs du widget
  final Article article;

  MainArticle({this.article});

  @override
  _MainArticleState createState() => _MainArticleState();
}

class _MainArticleState extends State<MainArticle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleDetails(
            article: widget.article,
          ); //send article here
        }));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Divider(
            //   color: Colors.grey,
            // ),
            SizedBox(
              height: 10.0,
            ),
            Html(
              data: widget.article.title,
              style: {
                "html": Style(
                  fontFamily: GoogleFonts.rubik(
                    fontWeight: FontWeight.bold,
                  ).fontFamily,
                  fontSize: FontSize(20.0),
                ),
              },
            ),

            SizedBox(
              height: 5.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                height: 300,
                width: double.infinity,
                child: widget.article.imageUrl == null
                    ? Image(
                        image: AssetImage(
                          "assets/images/no_image.png",
                        ),
                      )
                    : Image.network(
                        widget.article.imageUrl,
                        fit: BoxFit.cover,
                        // loadingBuilder: (context, child, loadingProgress) {
                        //   return loadingProgress == null
                        //       ? child
                        //       : LinearProgressIndicator();
                        // },
                      ),
              ),
            ),
            SizedBox(
              height: 0.0,
            ),

            Container(
              child: Html(
                data: widget.article.excerpt,
                style: {
                  "html": Style(
                    //backgroundColor: Colors.red,
                    fontFamily: GoogleFonts.rubik(
                      color: Color(0xFF5B5858),
                    ).fontFamily,
                    fontSize: FontSize(18.0),
                  ),
                },
              ),
              // Text(htmlToString(widget.article.excerpt),
              //     style: GoogleFonts.rubik(
              //       //color: Color(0xFF5B5858),
              //       fontSize: 18.0,
              //     )),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

String stringFormat(String s) {
  String string = s.toLowerCase();
  String newString = string[0].toUpperCase() + string.substring(1);
  print("newString = $newString");
  return newString;
}

String htmlToString(String htmlData) {
  print("before removing : $htmlData");
  String newString = htmlData
      .replaceAll("<p>", "")
      .replaceAll("</p>", "")
      .replaceAll("[&hellip;]", "...")
      .replaceAll("&nbsp; ", "");
  print("after removing : $newString");
  return newString;
}
