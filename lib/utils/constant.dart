import 'package:nouvel_horizon_app/model/article_model.dart';
import 'package:nouvel_horizon_app/model/category.dart';

String kCategoryUrl = 'https://nouvelhorizonmali.com/wp-json/wp/v2/categories';
String kFirst10PostUrl =
    "http://lesoirdebko.ml/wp-json/wp/v2/posts?_fields=id,title,excerpt,content,featured_media,_links";
// par page
// http://lesoirdebko.ml/wp-json/wp/v2/posts?page=1&_fields=id,title,excerpt,content,featured_media,_links
// http://lesoirdebko.ml/wp-json/wp/v2/posts
// http://lesoirdebko.ml/wp-json/wp/v2/categories
//http://lesoirdebko.ml/wp-json/
// /wp/v2/posts?_fields=author,id,excerpt,title,link // on utilise fields pour
//récuperer seulement les champs dont on a besoin. Permet d'alleger le poids
//des données à récupérer

//pour récuperer les articles d'une category. il suffit de mettre l'id de la category à la fin de l'url
//http://lesoirdebko.ml/wp-json/wp/v2/posts?categories=41

//pour les infos d'une category spécifique. Ne renvoie pas les articles
//http://lesoirdebko.ml/wp-json/wp/v2/categories/1298 ou /?id=$id_category

// http://lesoirdebko.ml/wp-json/wp/v2/posts?_fields=id,excerpt,title

//http://lesoirdebko.ml/wp-json/wp/v2/media/5895 -> url media du post. On met Article.mediaID à la fin

// Article kArticle1 = Article(
//     title: "Retrait de l'âge pivot: Elisabeth Borne "
//         "juge qu'il n'y a plus aucune raison que"
//         "la grève se poursuive",
//     excerpt: "Ces propos sont du patron de l’opposition depuis"
//         "le palais de la culture Amadou hampathé .",
//     content: "Improved own provided blessing may peculiar domestic. "
//         "Sight house has sex never. No visited raising gravity "
//         "outward subject my cottage mr be. Hold do at tore in park"
//         " feet near my case. \n\nInvitation at understood occasional "
//         "sentiments insipidity inhabiting in. Off melancholy "
//         "alteration principles old. Is do speedily kindness "
//         "properly oh. Respect article painted cottage he is "
//         "offices parlors. \n\n"
//         "An sincerity so extremity he additions. Her yet there "
//         "truth merit. Mrs all projecting favourable now unpleasing. "
//         "Son law garden chatty temper. \n\nOh children provided to mr "
//         "elegance marriage strongly. Off can admiration prosperous n"
//         "ow devonshire diminution law.",
//     //author: 'Lebron',
//     // date: '18 janvier 2020',
//     // imageUrl: 'assets/article1.jpg');

// Article kArticle2 = Article(
//     title: "Retrait de l'âge pivot: Elisabeth Borne "
//         "juge qu'il n'y a plus aucune raison que"
//         "la grève se poursuive",
//     excerpt: "Ces propos sont du patron de l’opposition depuis"
//         "le palais de la culture Amadou hampathé .",
//     content: "Improved own provided blessing may peculiar domestic. "
//         "Sight house has sex never. No visited raising gravity "
//         "outward subject my cottage mr be. Hold do at tore in park"
//         " feet near my case. \n\nInvitation at understood occasional "
//         "sentiments insipidity inhabiting in. Off melancholy "
//         "alteration principles old. Is do speedily kindness "
//         "properly oh. Respect article painted cottage he is "
//         "offices parlors. \n\n"
//         "An sincerity so extremity he additions. Her yet there "
//         "truth merit. Mrs all projecting favourable now unpleasing. "
//         "Son law garden chatty temper. \n\nOh children provided to mr "
//         "elegance marriage strongly. Off can admiration prosperous n"
//         "ow devonshire diminution law.",
//     author: 'Mr Flutter',
//     date: '16 janvier 2019',
//     imageUrl: 'assets/article2.jpg');
// Article kArticle3 = Article(
//     title: "Retrait de l'âge pivot: Elisabeth Borne "
//         "juge qu'il n'y a plus aucune raison que"
//         "la grève se poursuive",
//     excerpt: "Ces propos sont du patron de l’opposition depuis"
//         "le palais de la culture Amadou hampathé .",
//     content: "Improved own provided blessing may peculiar domestic. "
//         "Sight house has sex never. No visited raising gravity "
//         "outward subject my cottage mr be. Hold do at tore in park"
//         " feet near my case. \n\nInvitation at understood occasional "
//         "sentiments insipidity inhabiting in. Off melancholy "
//         "alteration principles old. Is do speedily kindness "
//         "properly oh. Respect article painted cottage he is "
//         "offices parlors. \n\n"
//         "An sincerity so extremity he additions. Her yet there "
//         "truth merit. Mrs all projecting favourable now unpleasing. "
//         "Son law garden chatty temper. \n\nOh children provided to mr "
//         "elegance marriage strongly. Off can admiration prosperous n"
//         "ow devonshire diminution law.",
//     author: 'Bugs bunny',
//     date: '19 juin 2041',
//     imageUrl: 'assets/article3.jpg');

// Article kArticle4 = Article(
//     title: "Retrait de l'âge pivot: Elisabeth Borne "
//         "juge qu'il n'y a plus aucune raison que"
//         "la grève se poursuive",
//     excerpt: "Ces propos sont du patron de l’opposition depuis"
//         "le palais de la culture Amadou hampathé .",
//     content: "Improved own provided blessing may peculiar domestic. "
//         "Sight house has sex never. No visited raising gravity "
//         "outward subject my cottage mr be. Hold do at tore in park"
//         " feet near my case. \n\nInvitation at understood occasional "
//         "sentiments insipidity inhabiting in. Off melancholy "
//         "alteration principles old. Is do speedily kindness "
//         "properly oh. Respect article painted cottage he is "
//         "offices parlors. \n\n"
//         "An sincerity so extremity he additions. Her yet there "
//         "truth merit. Mrs all projecting favourable now unpleasing. "
//         "Son law garden chatty temper. \n\nOh children provided to mr "
//         "elegance marriage strongly. Off can admiration prosperous n"
//         "ow devonshire diminution law.",
//     author: 'Sidiki SAKO',
//     date: '12 janvier 2020',
//     imageUrl: 'assets/article4.jpg');

// Article kArticle5 = Article(
//     title: "Retrait de l'âge pivot: Elisabeth Borne "
//         "juge qu'il n'y a plus aucune raison que"
//         "la grève se poursuive",
//     excerpt: "Ces propos sont du patron de l’opposition depuis"
//         "le palais de la culture Amadou hampathé .",
//     content: "Improved own provided blessing may peculiar domestic. "
//         "Sight house has sex never. No visited raising gravity "
//         "outward subject my cottage mr be. Hold do at tore in park"
//         " feet near my case. \n\nInvitation at understood occasional "
//         "sentiments insipidity inhabiting in. Off melancholy "
//         "alteration principles old. Is do speedily kindness "
//         "properly oh. Respect article painted cottage he is "
//         "offices parlors. \n\n"
//         "An sincerity so extremity he additions. Her yet there "
//         "truth merit. Mrs all projecting favourable now unpleasing. "
//         "Son law garden chatty temper. \n\nOh children provided to mr "
//         "elegance marriage strongly. Off can admiration prosperous n"
//         "ow devonshire diminution law.",
//     author: 'Sidiki SAKO',
//     date: '12 janvier 2020',
//     imageUrl: 'assets/article5.jpg');
