import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

Future<List<Articles>> _fetchArticleBySource(String source) async {
  var response = await http.get(
      "https://newsapi.org/v2/top-headlines?sources=${source}&apiKey=26177c7ba8a54b4b9c46981f1b53a11d");
  if (response.statusCode == 200) {
    List articles = json.jsonDecode(response.body)['articles'];
    print(articles.length);
    return articles.map((article) => Articles.fromJson(article)).toList();
  } else {
    throw Exception("Failed To Load");
  }
}

class ArticleHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ArticlePage(),
    );
  }
}

class ArticlePage extends StatefulWidget {
  final Sources sources;

  ArticlePage({this.sources});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  var list_articles;
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<Null> refreshListArticle() async {
    refreshKey.currentState?.show(atTop: false);

    setState(() {
      list_articles = _fetchArticleBySource(widget.sources.id);
    });

    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    refreshListArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.sources.name,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}





















