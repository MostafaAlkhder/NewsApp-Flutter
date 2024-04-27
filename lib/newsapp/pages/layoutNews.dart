import 'package:bmicalclutor/newsapp/common/constants.dart';
import 'package:bmicalclutor/newsapp/data/bloc/cubit.dart';
import 'package:bmicalclutor/newsapp/data/bloc/states.dart';
import 'package:bmicalclutor/newsapp/pages/searchScreen.dart';
import 'package:bmicalclutor/shared/components.dart';
import 'package:bmicalclutor/tasks/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutNews extends StatelessWidget {
  const LayoutNews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusiness()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Layout News"),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: bottomItems,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
            ),
            body: screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
