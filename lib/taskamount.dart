import 'package:commit_to_self/taskduedate.dart';
import 'package:flutter/material.dart';

import './main.dart';
import "./task.dart";

class TaskAmount extends StatelessWidget {

  Task newTask = new Task("","","",0);

  TaskAmount(Task newTask){
    this.newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
    //returns a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Add an amount"),
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
                labelText: "Amount:",
              ),
              keyboardType: TextInputType.number,
              onChanged: (text){
                this.newTask.amount = int.parse(text);
              },
            ),
            // dueDate != "" ? Text("The dueDate is : " + dueDate) : Text("There is no due date"),

          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskDueDate(newTask)),
          );
        },
        tooltip: 'Add Amount',
        child: Icon(Icons.add),
      ),
    );
  }

}