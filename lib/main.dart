import 'package:flutter/material.dart';

import "./taskTitle.dart";
import './task.dart';

void main() {
  runApp(MyApp(null));
}


class MyApp extends StatelessWidget {

  String amount;
  Task task;
  MyApp(Task task){
    // amount = amount;
    task = task;
    // if(amount != ""){
    //   print("The value of amount is: " + amount);
    // }
    if(task != null){
      print("task: " + task.amount.toString());
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
      home: MyHomePage(amount),
    );
  }
}

class MyHomePage extends StatefulWidget {

  String amount;

  MyHomePage(String amount){
    amount = amount;
  }

  @override
  MyHomePageState createState() => MyHomePageState(amount);
}

class MyHomePageState extends State<MyHomePage> {

  String amount;
  MyHomePageState(String amount){
    amount = amount;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Commit to self"),
      ),
      body: Text("You do not have any task yet"),
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