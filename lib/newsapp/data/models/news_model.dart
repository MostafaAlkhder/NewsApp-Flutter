class NewsModel {
  final String title;
  final String? imageUrl;
  final String date;
  final String url;
  NewsModel(
      {required this.title,
      required this.date,
      this.imageUrl,
      required this.url});

  factory NewsModel.fromJsom(Map<String, dynamic> json) => NewsModel(
        title: json['title'],
        date: json['publishedAt'],
        url: json['url'],
        imageUrl: json['urlToImage'] ??
            'https://bna-media.s3-eu-west-1.amazonaws.com/Media/Images/News/Arab-News/%D8%A7%D9%84%D8%A8%D8%B1%D9%84%D9%85%D8%A7%D9%86%20%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A-f0564f31-6136-4d95-9ed0-e9c064793a33.jpeg',
      );

  static List<NewsModel> fromJsonList(Map<String, dynamic> json) {
    List<NewsModel> news = [];
    json['articles'].forEach(
      (e) => news.add(
        NewsModel.fromJsom(e),
      ),
    );
    return news;
  }
}
