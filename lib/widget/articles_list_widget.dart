import 'package:flutter/material.dart';
import 'package:nouvel_horizon_app/model/article_model.dart';

import 'main_article.dart';

class ArticleListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final List<Article> listArticles;
  final bool hasArticles;

  ArticleListWidget(
      {this.listArticles, this.scrollController, this.hasArticles});
  @override
  _ArticleListWidgetState createState() => _ArticleListWidgetState();
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          controller: widget.scrollController,
          itemCount: widget.listArticles.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < widget.listArticles.length) {
              return MainArticle(
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
