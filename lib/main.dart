import 'package:flutter/material.dart';

import "./taskTitle.dart";
import './task.dart';

void main() {
  runApp(MyApp(null));
}

class MyApp extends StatelessWidget {

  List<Task> tasks = [];
  Task task;

  MyApp(Task task){
    print("MyApp...");
    if(task != null){
      this.task = task;
      this.tasks.add(this.task);
      print("new task assigned");
      print("title: " + this.task.title);
      print("description: " + this.task.description);
      print("length of tasks: " + this.tasks.length.toString());
    }else{
      print("new task is null in home page");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commit To Self',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(this.tasks),
    );
  }
}

class MyHomePage extends StatefulWidget {

  List<Task> tasks = [];

  MyHomePage(List<Task> tasks){
    this.tasks = tasks;
  }

  @override
  MyHomePageState createState() => MyHomePageState(this.tasks);
}

class MyHomePageState extends State<MyHomePage> {

  List<Task> tasks = [];
  MyHomePageState(List<Task> tasks){
    this.tasks = tasks;
  }

  @override
  Widget build(BuildContext context) {
    if (this.tasks != null){
      print("length of tasks: " + tasks.length.toString());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Commit to self"),
      ),
      body: Text(((){
        if(this.tasks != null){
          if(this.tasks.length > 0){
            return "you have a task!";
          }
        }
        return "click the button to add a task";
      })()),
      //  Text("You do not have any task yet"),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskTitle()),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}