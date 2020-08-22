import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/widget/ads_container.dart';

class ArticleDetails extends StatefulWidget {
  final Article article;
  ArticleDetails({this.article});

  @override
  _ArticleDetailsState createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
          'LESOIR DE BAMAKO',
          style: GoogleFonts.permanentMarker(
            color: Colors.black,
            fontSize: 25.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300.0,
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.article.title,
                    style: GoogleFonts.rubik(
                        fontWeight: FontWeight.bold, fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.article.excerpt,
                    style: GoogleFonts.rubik(
                      fontSize: 18.0,
                      color: Color(0xFF5B5858),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 2.0,
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
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    widget.article.content,
                    style: GoogleFonts.rubik(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  )
                ],
              ),
            ),
            AdsContainer(),
          ],
        ),
      ),
    );
  }
}
