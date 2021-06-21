import 'dart:convert';
import 'package:ui_uxnews/models/new.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=6a9798f1c77a4ad39d4fd0322edfecf5";

  Future <List<News>> getNews() async {
    final response = await http.get(Uri.tryParse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<News> news = body.map((item) => News.fromJson(item)).toList();

      return news;
    } else {
      throw Exception("Can'get the news!");
    }
  }
}




