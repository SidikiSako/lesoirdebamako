class Article {
  final int id;
  final String title;
  final String content;
  final String excerpt;
  final String imageUrl;
  final String date;
  final String author;

  //String date;
  //String author;

  //final int imageId;

  // int getImageID() {
  //   return imageId;
  // }

  Article({
    this.title,
    this.id,
    this.content,
    this.excerpt,
    //this.imageId,
    this.imageUrl,
    this.date,
    this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    //print("MEDIA = ${json["_embedded"]["wp:featuredmedia"][0]["source_url"]}");
    return Article(
      id: json["id"],
      title: json["title"]["rendered"],
      content: json["content"]["rendered"],
      excerpt: json["excerpt"]["rendered"],
      imageUrl: json["_embedded"]["wp:featuredmedia"][0]["source_url"],
      date: json["modified"],
      author: json["_embedded"]["author"][0]["name"],
    );
  }

  //pour les articles qui n'ont pas d'image donc pas de _embedded dans la reponse
  factory Article.fromJson2(Map<String, dynamic> json) {
    //print("MEDIA = ${json["_embedded"]["wp:featuredmedia"][0]["source_url"]}");
    return Article(
      id: json["id"],
      title: json["title"]["rendered"],
      content: json["content"]["rendered"],
      excerpt: json["excerpt"]["rendered"],
      imageUrl: null,
      date: json["modified"],
      author: json["_embedded"]["author"][0]["name"],
    );
  }
}
