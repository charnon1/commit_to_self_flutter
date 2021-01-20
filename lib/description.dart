import 'package:flutter/material.dart';

import "./taskamount.dart";
import "./task.dart";

class TaskDescription extends StatelessWidget {

Task newTask = new Task("","","",0);

  TaskDescription(Task newTask){
    this.newTask = newTask;
  }
  @override
  Widget build(BuildContext context) {
    //returns a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Description"),
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
                this.newTask.description = text;
              },
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAmount(this.newTask)),
          );
        },
        tooltip: 'Add Title',
        child: Icon(Icons.add),
      ),
    );
  }

}