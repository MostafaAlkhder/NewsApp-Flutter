import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:bmicalclutor/tasks/cubit.dart';
import 'package:bmicalclutor/tasks/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Layout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  IconData suffixIcon = Icons.add;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  bool suffixPressed = false;

  // Future<String> getName() async {
  //   return 'Mostafa Alkhder';
  // }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatebase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: AnimatedConditionalBuilder(
                // condition: tasks.length > 0,
                condition: state is! AppGetDatabaseLoadingState,
                builder: (BuildContext context) =>
                    cubit.screens[cubit.currentIndex],
                fallback: (BuildContext context) => Center(
                      child: Text(
                        "New Tasks Is Empty",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (!cubit.isBottomSheetShown) {
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: titleController,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'title must be not empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Task Title',
                                    prefixIcon: Icon(Icons.title),
                                    suffixIcon: suffixIcon != null
                                        ? null
                                        : IconButton(
                                            onPressed: () {
                                              if (suffixPressed) {
                                                return null;
                                              } else {}
                                            },
                                            icon: Icon(suffixIcon)),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: timeController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      if (value != null) {
                                        timeController.text =
                                            value!.format(context).toString();
                                        print(value.toString());
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'title must be not empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Time',
                                    prefixIcon:
                                        Icon(Icons.watch_later_outlined),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  keyboardType: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate:
                                                DateTime.parse('1970-09-29'),
                                            lastDate:
                                                DateTime.parse('2050-09-29'))
                                        .then((value) {
                                      if (value != null)
                                        dateController.text =
                                            DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  validator: (value) {
                                    if (value.toString().isEmpty) {
                                      return 'Date must be not empty';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Date',
                                    prefixIcon:
                                        Icon(Icons.calendar_view_day_rounded),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 20.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);

                  // setState(() {
                  //   iconfab = Icons.add;
                  // });
                } else {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatebase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                    // insertToDatebase(
                    //         title: titleController.text,
                    //         date: dateController.text,
                    //         time: timeController.text)
                    //     .then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //     // setState(() {
                    //    // isBot tomSheetShown = false;
                    //     //   iconfab = Icons.edit;
                    //     //   tasks = value;
                    //     // });
                    //   });
                    // });
                  }
                }
              },
              child: Icon(cubit.iconfab),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
              elevation: 20.0,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}
