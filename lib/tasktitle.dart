import 'package:flutter/material.dart';

import "./taskDueDate.dart";
import "./main.dart";
import "./task.dart";

class TaskTitle extends StatelessWidget {

  Task newTask = new Task("","","",0);
  CounterStorage storage;

  TaskTitle(CounterStorage storage){
    this.storage = storage;
  }

  @override
  Widget build(BuildContext context) {
    //returns a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a title"),
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
                labelText: "Title:",
              ),
              onChanged: (text){
                this.newTask.title = text;
                print("title set in title page");
              },
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskDueDate(this.storage, this.newTask)),
          );
        },
        tooltip: 'Add Title',
        child: Icon(Icons.add),
      ),
    );
  }

}