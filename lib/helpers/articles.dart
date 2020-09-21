import 'package:backtotheroots/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Articles {
  List<ArticleModel> articles = [];

  Future<void> getArticles() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6daf3a8d372f450d80bd1ba97b4afede";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            urlToImage: element['urlToImage'],
            description: element['description'],
            url: element['url'],
          );
          articles.add(articleModel);
        }
      });
    }
  }
}
