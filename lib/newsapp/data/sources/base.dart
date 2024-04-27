import 'package:bmicalclutor/newsapp/data/models/news_model.dart';

abstract class BaseNews {
  Future<List<NewsModel>> getNews(String category);
}
