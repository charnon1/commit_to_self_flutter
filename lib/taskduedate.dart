import 'package:flutter/material.dart';
import "./task.dart";

import "./taskAmount.dart";
import "./main.dart";

class TaskDueDate extends StatelessWidget {

  Task newTask = new Task("","","",0);
  CounterStorage storage;

  TaskDueDate(CounterStorage storage, Task newTask){
    this.storage = storage;
    this.newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
    //returns a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a description"),
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
              onChanged: (description){
                this.newTask.description = description;
                print("description set in the task due date page");
              },
            ),
          // title != "" ? Text("The title is: " + title) : Text("There is no title")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAmount(this.storage, newTask)),
          );
        },
        tooltip: 'Add Description',
        child: Icon(Icons.add),
      ),
    );
  }

}