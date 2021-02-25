import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/model/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController input = TextEditingController();
  bool isValid = false;
  @override
  void dispose() {
    super.dispose();
    input.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              onChanged: (val) {
                setState(() {
                  if (val.isNotEmpty)
                    isValid = true;
                  else
                    isValid = false;
                });
              },
              controller: input,
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            FlatButton(
              disabledColor: Colors.grey,
              onPressed: !isValid
                  ? null
                  : () {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(Task(name: input.text.trim()));
                      Navigator.of(context).pop();
                    },
              color: Colors.lightBlueAccent,
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
