import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
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
          'LE SOIR DE BAMAKO',
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
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: <Widget>[
                  Html(
                    data: widget.article.title,
                    style: {
                      "html": Style(
                        fontFamily: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold,
                        ).fontFamily,
                        fontSize: FontSize(22),
                      ),
                    },
                  ),
                  // Text(
                  //   widget.article.title,
                  //   style: GoogleFonts.rubik(
                  //       fontWeight: FontWeight.bold, fontSize: 22.0),
                  // ),
                  SizedBox(
                    height: 0.0,
                  ),
                  Html(
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
                  // Text(
                  //   widget.article.excerpt,
                  //   style: GoogleFonts.rubik(
                  //     fontSize: 18.0,
                  //     color: Color(0xFF5B5858),
                  //   ),
                  // ),
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
                            Icons.person_outline,
                            size: 18.0,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(widget.article.author),
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
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
                          Text(dateFormat(widget.article.date))
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
                  Html(
                    data: widget.article.content,
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
                  // Text(
                  //   widget.article.content,
                  //   style: GoogleFonts.rubik(
                  //     color: Colors.black,
                  //     fontSize: 18.0,
                  //   ),
                  // ),
                ],
              ),
            ),
            //AdsContainer(),
          ],
        ),
      ),
    );
  }

  String dateFormat(String data) {
    print("LA DATE AVANT FORMATAGE = $data");
    //String date = "";
    String day = data.substring(8, 10);
    String month = data.substring(5, 7);
    String year = data.substring(0, 4);
    int monthToInt = int.parse(month);
    if (monthToInt == 01) {
      month = "Janvier";
    } else if (monthToInt == 02) {
      month = "Fevrier";
    } else if (monthToInt == 03) {
      month = "Mars";
    } else if (monthToInt == 04) {
      month = "Avril";
    } else if (monthToInt == 05) {
      month = "Mai";
    } else if (monthToInt == 06) {
      month = "Juin";
    } else if (monthToInt == 07) {
      month = "Juillet";
    } else if (monthToInt == 08) {
      month = "Aout";
    } else if (monthToInt == 09) {
      month = "Septembre";
    } else if (monthToInt == 10) {
      month = "Octobre";
    } else if (monthToInt == 11) {
      month = "Novembre";
    } else {
      month = "Décembre";
    }

    String date = day + " " + month + " " + year;
    return date;
  }
}
