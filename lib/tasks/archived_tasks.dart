import 'package:animated_conditional_builder/animated_conditional_builder.dart';
import 'package:bmicalclutor/tasks/cubit.dart';
import 'package:bmicalclutor/tasks/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchivedTasks extends StatelessWidget {
  const ArchivedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is AppGetDatabaseLoadingState) {}
      },
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return AnimatedConditionalBuilder(
          condition: tasks.length > 0,
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  color: Colors.grey,
                  size: 100.0,
                ),
                Text(
                  "No Tasks Yey , Please Add Some Tasks",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          builder: (context) => ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                    key: Key(tasks[index]["id"].toString()),
                    onDismissed: (direction) {
                      AppCubit.get(context).deleteData(id: tasks[index]["id"]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 45.0,
                            child: Text('${tasks[index]["time"]}'),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${tasks[index]["title"]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                Text(
                                  '${tasks[index]['date']}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).updateData(
                                    status: "done", id: tasks[index]['id']);
                              },
                              icon: Icon(
                                Icons.check_box,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).updateData(
                                    status: "archived", id: tasks[index]['id']);
                              },
                              icon: Icon(Icons.archive, color: Colors.black45)),
                        ],
                      ),
                    ),
                  ),
              separatorBuilder: (context, index) => Container(
                  width: double.infinity, height: 1.0, color: Colors.grey[300]),
              itemCount: tasks.length),
        );
      },
    );
  }
}
