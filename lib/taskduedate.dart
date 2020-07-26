import 'package:flutter/material.dart';

import "./taskAmount.dart";
class TaskDueDate extends StatelessWidget {

  String title= "";

  TaskDueDate(String title){
    this.title = title;
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
            ),
          title != "" ? Text("The title is: " + title) : Text("There is no title")

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskAmount("today")),
          );
        },
        tooltip: 'Add Description',
        child: Icon(Icons.add),
      ),
    );
  }

}