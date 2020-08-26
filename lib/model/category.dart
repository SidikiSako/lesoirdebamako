import 'package:flutter/material.dart';

class Category {
  final String name;
  final int categoryID;
  final Widget categoryIcon;

  Category({this.name, this.categoryID, this.categoryIcon});

  String getCategoryLink() {
    return "http://lesoirdebko.ml/wp-json/wp/v2/posts?_embed=wp:featuredmedia&page=${categoryID}&_fields=id,title,excerpt,content,featured_media,_links";
  }

  void getListOfCategory() {}
}
