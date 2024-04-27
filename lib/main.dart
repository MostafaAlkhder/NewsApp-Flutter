import 'package:bmicalclutor/newsapp/data/models/onBoarding.dart';
import 'package:bmicalclutor/styles/themes.dart';
import 'package:bmicalclutor/newsapp/network/local/cacheHelper.dart';
import 'package:bmicalclutor/newsapp/network/remote/deoHelper.dart';
import 'package:bmicalclutor/newsapp/pages/layoutNews.dart';
import 'package:bmicalclutor/shared/bloc_observer.dart';
import 'package:bmicalclutor/tasks/cubit.dart';
import 'package:bmicalclutor/tasks/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            theme: Thmes.mainTheme,
            darkTheme: Thmes.darkTheme,
            home: Directionality(
                textDirection: TextDirection.ltr, child: OnBoardingScreen()),
          );
        },
      ),
    );
  }
}
