class ArticleModel {
  late int id;
  late String title;
  late String url;
  late String imageUrl;
  late String newsSite;
  late String summary;
  late String publishedAt;
  late String updatedAt;
  late bool featured;

  ArticleModel({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    imageUrl = json['imageUrl'];
    newsSite = json['newsSite'];
    summary = json['summary'];
    publishedAt = json['publishedAt'];
    updatedAt = json['updatedAt'];
    featured = json['featured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['imageUrl'] = this.imageUrl;
    data['newsSite'] = this.newsSite;
    data['summary'] = this.summary;
    data['publishedAt'] = this.publishedAt;
    data['updatedAt'] = this.updatedAt;
    data['featured'] = this.featured;

    return data;
  }
}
