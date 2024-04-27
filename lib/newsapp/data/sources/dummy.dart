import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:bmicalclutor/newsapp/data/sources/base.dart';

class DummyNews extends BaseNews {
  @override
  Future<List<NewsModel>> getNews(String category) {
    return Future.delayed(
      Duration(seconds: 3),
      () {
        return [
          NewsModel(title: 'title', date: 'date', url: 'url'),
        ];
      },
    );
  }
}
