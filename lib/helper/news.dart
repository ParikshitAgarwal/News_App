import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/article_model.dart';

class News {
  var news;
  List<ArticleModel> newsList = [];
  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=e27e79c0932a4445b853ddfea265ddde");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      news = jsonData;
      // newsList.add(ArticleModel(author: , title: title, desc: desc, url: url, urlToImage: urlToImage, content: content))
    }
  }
}

class CategoryNews {
  var news;
  List<ArticleModel> newsList = [];
  Future<void> getCategoryNews(String categoryName) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$categoryName&apiKey=e27e79c0932a4445b853ddfea265ddde");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      news = jsonData;
      // newsList.add(ArticleModel(author: , title: title, desc: desc, url: url, urlToImage: urlToImage, content: content))
    }
  }
}
