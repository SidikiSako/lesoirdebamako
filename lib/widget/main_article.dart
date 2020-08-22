import 'package:flutter/material.dart';
//import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/screens/article_details_screen.dart';
//import 'package:flutter_html/flutter_html.dart';

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
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              widget.article.title,
              style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            SizedBox(
              height: 15.0,
            ),
            // Row(
            //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: <Widget>[
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Icon(
            //           Icons.person,
            //           size: 18.0,
            //         ),
            //         SizedBox(
            //           width: 2.0,
            //         ),
            //         Text(
            //           "Par Sidiki à delete}",
            //           style: GoogleFonts.rubik(
            //             fontSize: 14.0,
            //             color: Color(0xFF5B5858),
            //           ),
            //         ),
            //       ],
            //     ),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     Row(
            //       children: <Widget>[
            //         Icon(
            //           Icons.timer,
            //           size: 15.0,
            //         ),
            //         SizedBox(
            //           width: 2.0,
            //         ),
            //         Text(
            //           'Le 13/06/1991',
            //           style: GoogleFonts.rubik(
            //             fontSize: 14.0,
            //             color: Color(0xFF5B5858),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 10.0,
            // ),
            Container(
              height: 250,
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
                    ),
            ),
            SizedBox(
              height: 15.0,
            ),
            // Text("Ce texte commence bien à gauche non ?"),
            // SizedBox(
            //   height: 0.0,
            // ),
            Container(
              child: Text(htmlToString(widget.article.excerpt),
                  style: GoogleFonts.rubik(
                    //color: Color(0xFF5B5858),
                    fontSize: 18.0,
                  )),
            ),
            // SizedBox(
            //   height: 10.0,
            // ),
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
