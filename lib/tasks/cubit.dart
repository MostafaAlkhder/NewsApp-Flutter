import 'package:bmicalclutor/newsapp/network/local/cacheHelper.dart';
import 'package:bmicalclutor/tasks/archived_tasks.dart';
import 'package:bmicalclutor/tasks/done_tasks.dart';
import 'package:bmicalclutor/tasks/new_tasks.dart';
import 'package:bmicalclutor/tasks/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  List<Widget> screens = [NewTasks(), DoneTasks(), ArchivedTasks()];
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  void createDatebase() {
    openDatabase(
      'testtt.db',
      version: 1,
      onCreate: (database, version) {
        print("Database created");
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)')
            .then((value) {
          print("table created");
        }).catchError((error) {
          print("Error when creating table${error.toString()}");
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        print('Database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatebase(
      {required String title,
      required String time,
      required String date}) async {
    return await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, status) VALUES("{$title}", "{$date}", "{$time}", "new")')
          .then((value) {
        emit(AppInsertDatabaseState());
        print("${value} inserted successfully");
        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserted New Record ${error.toString()}');
      });
      // return null;
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
        ;
      });

      emit(AppGetDatabaseState());
    });
    ;
  }

  void updateData({
    required String status,
    required int id,
  }) async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE From tasks WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData iconfab = Icons.add;
  void changeBottomSheetState({required bool isShow, required IconData icon}) {
    isBottomSheetShown = isShow;
    iconfab = icon;
    emit(AppChangeBottomSheetState());
  }

  bool isDark = false;
  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}
