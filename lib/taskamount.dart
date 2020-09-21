import 'package:flutter/material.dart';

import './main.dart';
import "./task.dart";

class TaskAmount extends StatelessWidget {

  Task newTask = new Task("","","",0);

  TaskAmount(Task newTask){
   if(newTask != null){
      print("newTask is not null. assigning...");
      this.newTask = newTask;
    }else{
      print("newTask is null in amount page");
    }
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
              
            ),
            // dueDate != "" ? Text("The dueDate is : " + dueDate) : Text("There is no due date"),

          ],

        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp(newTask)),
          );
        },
        tooltip: 'Add Amount',
        child: Icon(Icons.add),
      ),
    );
  }

}