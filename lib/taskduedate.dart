import 'package:flutter/material.dart';
import "./task.dart";

import "./taskAmount.dart";
class TaskDueDate extends StatelessWidget {

  Task newTask = new Task("","","",0);

  TaskDueDate(Task newTask){
    if(newTask != null){
      print("newTask is not null. assigning...");
      print("newTask title: " + newTask.title);
      this.newTask = newTask;

    }else{
      print("newTask is null in dueDate page");
    }
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
            MaterialPageRoute(builder: (context) => TaskAmount(newTask)),
          );
        },
        tooltip: 'Add Description',
        child: Icon(Icons.add),
      ),
    );
  }

}