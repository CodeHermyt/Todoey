import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  const TaskTile(this.task);
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.name,
        style: TextStyle(
          decoration: widget.task.isDone
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: (newValue) {
          setState(() {
            isChecked = newValue;
            Provider.of<TaskData>(context, listen: false)
                .taskToggle(widget.task);
          });
        },
      ),
    );
  }
}
