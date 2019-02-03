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

//  NewsAPI.fromJson(Map<String, dynamic> json) {
//    status = json['status'];
//    if (json['sources'] != null) {
//      sources = new List<Sources>();
//      json['sources'].forEach((v) {
//        sources.add(new Sources.fromJson(v));
//      });
//    }
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['status'] = this.status;
//    if (this.sources != null) {
//      data['sources'] = this.sources.map((v) => v.toJson()).toList();
//    }
//    return data;
//  }
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

//  Sources.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    name = json['name'];
//    description = json['description'];
//    url = json['url'];
//    category = json['category'];
//    language = json['language'];
//    country = json['country'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['name'] = this.name;
//    data['description'] = this.description;
//    data['url'] = this.url;
//    data['category'] = this.category;
//    data['language'] = this.language;
//    data['country'] = this.country;
//    return data;
//  }
}
