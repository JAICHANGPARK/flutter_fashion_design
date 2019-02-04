import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fashion_design/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

import 'package:url_launcher/url_launcher.dart';

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
      body: Center(
        child: RefreshIndicator(
          child: FutureBuilder<List<Articles>>(
            future: list_articles,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else if (snapshot.hasData) {
                List<Articles> articles = snapshot.data;
                return ListView(
                    children: articles
                        .map((article) => GestureDetector(
                              onTap: () {
                                _launchUrl(article.url);
                              },
                              child: Card(
                                elevation: 1.0,
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 24.0, horizontal: 4.0),
                                      width: 100.0,
                                      height: 100.0,
                                      child: article.urlToImage != null
                                          ? Image.network(
                                              article.urlToImage,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.network(
                                              "https://cdn.pixabay.com/photo/2015/07/27/22/56/city-863692_960_720.jpg",
                                              fit: BoxFit.cover),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8.0,
                                                      top: 20.0,
                                                      bottom: 10.0),
                                                  child: Text(
                                                    '${article.title}',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            //awwww
                                            margin: EdgeInsets.only(left: 8.0),
                                            child: Text(
                                              '${article.description}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 8.0,
                                                top: 8.0,
                                                bottom: 8.0),
                                            child: Text(
                                              'Published At : ${article.publishedAt}',
                                              style: TextStyle(
                                                  color: Colors.black12,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList());
              }

              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              );
            },
          ),
          onRefresh: refreshListArticle,
          key: refreshKey,
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    //TODO need to import url_launcher hmmm flutter web view?
    if (await canLaunch(url)) {
      await launch(url);
    } else {

      throw('Couldn\'t launch $url');

    }
  }
}



















