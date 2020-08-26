import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nouvel_horizon_app/model/category.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nouvel_horizon_app/screens/category_details_screen.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categoryList = [
    Category(
      name: "À la une",
      categoryID: 41,
      categoryIcon: Icon(
        FontAwesomeIcons.hotjar,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Actualité régionale",
      categoryID: 7,
      categoryIcon: Icon(
        FontAwesomeIcons.mapMarked,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Actualité nationale",
      categoryID: 6,
      categoryIcon: Icon(
        FontAwesomeIcons.solidFlag,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Afrique",
      categoryID: 1298,
      categoryIcon: Icon(
        FontAwesomeIcons.globeAfrica,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Agriculture",
      categoryID: 10,
      categoryIcon: Icon(
        FontAwesomeIcons.seedling,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Analyse",
      categoryID: 8,
      categoryIcon: Icon(
        FontAwesomeIcons.chartLine,
        color: Colors.black,
      ),
    ),
    Category(
      name: "Banque",
      categoryID: 27,
      categoryIcon: Icon(
        FontAwesomeIcons.university,
        color: Colors.black,
      ),
    ),
    Category(
      name: "BTP",
      categoryID: 12,
      categoryIcon: Icon(
        FontAwesomeIcons.tractor,
        color: Colors.black,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    print("CategoryList length = ${categoryList.length}");
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 30.0, 0, 10),
            child: Container(
              // decoration: BoxDecoration(
              //   border: Border.all(
              //       color: Colors.black, width: 1, style: BorderStyle.solid),
              // ),
              width: double.infinity,
              child: Text(
                "ARTICLES PAR CATEGORIE",
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B5858),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: Container(
              //color: Colors.red,
              child: ListView.builder(
                  itemCount: categoryList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        categoryList[index].name,
                        style: GoogleFonts.rubik(
                          fontSize: 16.0,
                          //color: Colors.black,
                        ),
                      ),
                      leading: categoryList[index].categoryIcon,
                      trailing: Icon(Icons.navigate_next),
                      onTap: () {
                        //on ouvre une page qui affiche la liste des articles de cette category
                        //navigator.push
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlesPerCategory(
                              category: categoryList[index],
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
