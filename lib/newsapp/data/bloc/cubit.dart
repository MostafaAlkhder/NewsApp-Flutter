import 'package:bmicalclutor/newsapp/pages/businessScreen.dart';
import 'package:bmicalclutor/newsapp/data/models/news_model.dart';
import 'package:bmicalclutor/newsapp/data/sources/dummy.dart';
import 'package:bmicalclutor/newsapp/data/sources/remote.dart';
import 'package:bmicalclutor/newsapp/network/remote/deoHelper.dart';
import 'package:bmicalclutor/newsapp/pages/scienceScreen.dart';
import 'package:bmicalclutor/newsapp/pages/settings/settingsScreen.dart';
import 'package:bmicalclutor/newsapp/pages/sportsScreen.dart';
// import 'package:bmicalclutor/newsapp/sports/sportsScreen.dart';
import 'package:bmicalclutor/newsapp/data/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  // ~ Sources
  final RemoteNews _remoteNews = RemoteNews();
  final DummyNews _dummyData = DummyNews();

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<NewsModel> business = [];

  Future<void> getBusiness() async {
    emit(NewsGetBusinessLoadingState());
    print("before get data form business");
    business = await _remoteNews.getNews('business');
    emit(NewsGetBusinessSuccessState());
    // emit(NewsBusinessErrorState(error.toString()));
  }

  List<NewsModel> sports = [];
  Future<void> getSports() async {
    emit(NewsGetSportsLoadingState());
    print("before get data from sports");
    sports = await _remoteNews.getNews('sports');
    emit(NewsGetSportsSuccessState());
    // emit(NewsBusinessErrorState(error.toString()));
  }

  List<NewsModel> science = [];
  Future<void> getScience() async {
    emit(NewsGetScienceLoadingState());
    print("before get data from science");
    science = await _remoteNews.getNews('science');
    emit(NewsGetScienceSuccessState());
    // emit(NewsBusinessErrorState(error.toString()));
  }

//   List<dynamic> sports = [];

//   void getSports() {
//     emit(NewsGetSportsLoadingState());
//     print("before get data sports");
//     DioHelper.getData(
//       url: 'v2/top-headlines',
//       query: {
//         'country': 'eg',
//         'category': 'sports',
//         'apikey': 'f664b39d32f945c3a0977f4ecda14185',
//       },
//     ).then((value) {
//       print("after get data sports");
//       sports = value.data['articles'];
//       print(sports.length);
//       print(sports[0]['title']);
//       emit(NewsGetSportsSuccessState());
//     }).catchError((error) {
//       emit(NewsSportsErrorState(error.toString()));
//     });
//   }

//   List<dynamic> science = [];

//   void getScience() {
//     emit(NewsGetScienceLoadingState());
//     print("before get data science");
//     DioHelper.getData(
//       url: 'v2/top-headlines',
//       query: {
//         'country': 'eg',
//         'category': 'science',
//         'apikey': 'f664b39d32f945c3a0977f4ecda14185',
//       },
//     ).then((value) {
//       print("after get data");
//       science = value.data['articles'];
//       print(science.length);
//       print(science[0]['title']);
//       emit(NewsGetScienceSuccessState());
//     }).catchError((error) {
//       emit(NewsScienceErrorState(error.toString()));
//     });
//   }
}
