import 'package:flutter/material.dart';
import 'dart:io';


import "./taskTitle.dart";
import './task.dart';
import 'dart:async';


import 'package:path_provider/path_provider.dart';


void main() {
  runApp( MaterialApp(
      title: 'Reading and Writing Files',
      home: MyHomePage(CounterStorage(), null),
    ),
  );
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeTask(String task) async {
    final file = await _localFile;
    print("file directory in writeTask: " + file.toString());

    // Write the file
    return file.writeAsString('$task');
  }
}

class MyHomePage extends StatefulWidget {

  CounterStorage storage;


  MyHomePage(CounterStorage storage, Task newTask){
    this.storage = storage;
    if(newTask != null){
      print("asString: " + newTask.asString);
      print("newTask title: " + newTask.title);
      print("newTask description: " + newTask.description);
      // write new task to file here
    }
    
  }

  @override
  MyHomePageState createState() => MyHomePageState(this.storage);
}

class MyHomePageState extends State<MyHomePage> {

  List<Task> tasks = [];
  CounterStorage storage;

  MyHomePageState(CounterStorage storage){
    this.storage = storage;
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
      body: Container(
        padding: EdgeInsets.fromLTRB(10,10,10,0),
        height: 150,
        width: double.maxFinite,
        child: Card(
          elevation: 5,
        ),
      ),
      // body: new ListView.builder(
      //   itemCount: this.tasks.length,
      //   itemBuilder: (BuildContext ctxt, int index){
      //     return new Card(
      //       child: Text("hello"),
      //     );
      //   },
      // ), 
      //  Text("You do not have any task yet"),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskTitle(storage)),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}