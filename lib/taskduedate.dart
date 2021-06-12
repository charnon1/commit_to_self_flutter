import 'package:flutter/material.dart';
import "./task.dart";
import "./home.dart";


class TaskDueDate extends StatelessWidget {

  Task newTask = new Task("","","",0);

  TaskDueDate(Task newTask){
    this.newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
    //returns a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a due date"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => print("going next"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Description:",
              ),
              onChanged: (text){
                this.newTask.dueDate = text;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(newTask)),
          );
        },
        tooltip: 'Add Description',
        child: Icon(Icons.add),
      ),
    );
  }

}