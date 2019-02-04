/**
 * https://javiercbk.github.io/json_to_dart/
 *
 */

/**
 *  Source is JsonArray..
 *
 * {"status":"ok",
 * "sources":[
 * {"id":"abc-news",
 * "name":"ABC News",
 * "description":"Your trusted source for breaking news, analysis,
 * exclusive interviews, headlines, and videos at ABCNews.com.",
 * "url":"https://abcnews.go.com",
 * "category":"general",
 * "language":"en",
 * "country":"us"},
 *
 */

class Articles {
  final Sources source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
        source: Sources.fromJsonForArticle(json['source']),
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content']);
  }
}

//------------------------------------------------------------------------------

class NewsAPI {
  String status;
  List<Sources> sources;

  NewsAPI({this.status, this.sources});

  factory NewsAPI.fromJson(Map<String, dynamic> json) {
    return NewsAPI(
      status: json['status'],
      sources: (json['sources'] as List)
          .map((source) => Sources.fromJson(source))
          .toList(),
    );
  }
}

class Sources {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Sources(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  factory Sources.fromJson(Map<String, dynamic> json) {
    return Sources(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
      language: json['language'],
      country: json['country'],
    );
  }

  factory Sources.fromJsonForArticle(Map<String, dynamic> json) {
    return Sources(
      id: json['id'],
      name: json['name'],
    );
  }
}
