import 'package:flutter/material.dart';
//import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/screens/article_details_screen.dart';
//import 'package:flutter_html/flutter_html.dart';

class PrimaryArticle extends StatefulWidget {
  final Article article;

  PrimaryArticle({this.article});
  @override
  _PrimaryArticleState createState() => _PrimaryArticleState();
}

class _PrimaryArticleState extends State<PrimaryArticle> {
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
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    //stringFormat(widget.article.title),
                    widget.article.title,
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: widget.article.imageUrl == null
                          ? Image(
                              image: AssetImage(
                                "images/logo.png",
                              ),
                            )
                          : Image.network(
                              widget.article.imageUrl,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  // Html(
                  //   data: widget.article.excerpt,
                  //   style: {
                  //     "p": Style(
                  //       fontFamily: GoogleFonts.rubik().fontFamily,
                  //       color: Color(0xFF5B5858),
                  //       fontSize: FontSize(18.0),
                  //     ),
                  //   },
                  // ),
                ],
              ),
            ),
          ),
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
  String newString = htmlData.replaceAll("\\<.*?\\>", "");
  print("after removing : $newString");
}
