import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:bmicalclutor/newsapp/data/sources/base.dart';
import 'package:bmicalclutor/newsapp/network/remote/deoHelper.dart';
import 'package:dio/dio.dart';

class RemoteNews extends BaseNews {
  @override
  Future<List<NewsModel>> getNews(String category) async {
    List<NewsModel> news = [];
    Response<dynamic> res = await DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': category,
        'apikey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    );

    news = NewsModel.fromJsonList(res.data);

    print("after get data ${category}");
    // business = value.data['articles'];
    // print(business.length);
    // print(business[0]['title']);
    // .then((value) {}).catchError((error) {});
    return news;
  }
}
