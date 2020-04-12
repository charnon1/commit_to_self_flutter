import 'package:flutter/material.dart';

import './tasktitle.dart';
import './task.dart';

void main() {
  runApp(MyApp(null));
}

List<Task> listOfTask;
Task newTask;
class MyApp extends StatelessWidget {

  MyApp(Task newTask){
    newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Commit To Self',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(newTask),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);

  MyHomePage(Task newTask){
  }

  @override
  MyHomePageState createState() => MyHomePageState(newTask);
}

class MyHomePageState extends State<MyHomePage> {

  MyHomePageState(Task newTask){
    if(newTask != null){
      listOfTask.add(newTask);
      setState((){
        listOfTask = listOfTask;
      });
      print("new length of listOfTask: " + listOfTask.length.toString());
    }else{
      print("newTask is null");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Commit to self"),
      ),
      body: listOfTask != null && listOfTask.length > 0 ? Text("You have some tasks") : Text("You do not have any task yet"),
      // Center(child: Text("You do not have any task yet.")),
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