import 'package:flutter/material.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/widget/other_article_layout.dart';

class ListOfArticlesPerCategoryID extends StatefulWidget {
  final ScrollController scrollController;
  final List<Article> listArticles;
  final bool hasArticles;
  ListOfArticlesPerCategoryID(
      {this.listArticles, this.hasArticles, this.scrollController});

  @override
  _ListOfArticlesPerCategoryIDState createState() =>
      _ListOfArticlesPerCategoryIDState();
}

class _ListOfArticlesPerCategoryIDState
    extends State<ListOfArticlesPerCategoryID> {
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 15, 15.0, 15),
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: widget.listArticles.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < widget.listArticles.length) {
              return OtherArticleLayout(
                article: widget.listArticles[index],
              );
            } else if (widget.hasArticles) {
              //index ==10 == on a déjà affiché les 10 articles index de 0 à 9
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              //il n'y plus d'articles à afficher
            }
          },
        ),
      ),
    );
  }
}
