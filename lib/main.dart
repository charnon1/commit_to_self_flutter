import 'package:flutter/material.dart';

import './tasktitle.dart';
import './task.dart';

void main() {
  runApp(MyApp());
}

List<Task> listOfTask;
Task newTask;
class MyApp extends StatelessWidget {

  MyApp({Task newTask = null}){
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
  Task newTask;

  MyHomePage(this.newTask);

  @override
  _MyHomePageState createState() => _MyHomePageState(newTask);
}

class _MyHomePageState extends State<MyHomePage> {

  _MyHomePageState(Task newTask){
    setState((){
      listOfTask: listOfTask.add(newTask);
    }); 
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