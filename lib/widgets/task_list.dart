import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Provider.of<TaskData>(context, listen: false).alltasks;
    return tasks.isEmpty
        ? Center(
            child: Text('Add Tasks first.'),
          )
        : ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(tasks[index]);
            },
          );
  }
}
