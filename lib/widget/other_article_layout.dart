import 'package:flutter/material.dart';
//import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/screens/article_details_screen.dart';
//import 'package:flutter_html/flutter_html.dart';

class OtherArticleLayout extends StatefulWidget {
  final Article article;

  OtherArticleLayout({this.article});
  @override
  _OtherArticleLayoutState createState() => _OtherArticleLayoutState();
}

class _OtherArticleLayoutState extends State<OtherArticleLayout> {
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
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
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
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.article.title,
                        style: GoogleFonts.rubik(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                        //overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                size: 15.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                "Par Sidiki SAKO del",
                                style: GoogleFonts.rubik(
                                  fontSize: 12.0,
                                  color: Color(0xFF5B5858),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 10.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Text(
                                'Le 13/06/1991',
                                style: GoogleFonts.rubik(
                                  fontSize: 12.0,
                                  color: Color(0xFF5B5858),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
