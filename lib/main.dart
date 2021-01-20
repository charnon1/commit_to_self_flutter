
import 'package:flutter/material.dart';
import 'dart:io';

import "./taskTitle.dart";
import './task.dart';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

void main() {
  runApp( MaterialApp(
      title: 'Reading and Writing Files',
      home: MyHomePage(null),
    ),
  );
}

class MyHomePage extends StatefulWidget {

  Task newTask;
  MyHomePage(Task newTask){
      this.newTask = newTask;   
  }

  @override
  MyHomePageState createState() => MyHomePageState(this.newTask);
}

class MyHomePageState extends State<MyHomePage> {

  var _tasks;

  MyHomePageState(Task newTask){
    if(newTask != null){
      //write to file
      writeTask(newTask.asString);
    }
    //read task file 
    _tasks = readTasks();

  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print("path to file: " + path );
    return File('$path/counter.txt');
  }

  Future<List<Task>> readTasks() async {
    List<Task> tasks = [];
    try {
      final file = await _localFile;

      // Read the file
      String contents = await file.readAsString();

      // print("Current list of strings:");
      // print(contents);

      // var split = contents.split(","); // []String
      RegExp exp = new RegExp(r",\n");
      
      Iterable<Match> matches = exp.allMatches(contents);
      matches.forEach((m)=>print(m.group(0)));

      // print("below is the split contents\n");
      // print(split);

      // for (var i=0; i < split.length; i++) {
      //   print("i: " + i.toString());
      //   print(split[i]);
      // }
      return tasks;
    } catch (e) {
      return [];
    }
  }

  Future<File> writeTask(String task) async {
    final file = await _localFile;
    // print("file directory in writeTask: " + file.toString()); // /Users/charnonng/Library/Developer/CoreSimulator/Devices/1E3FF9AF-1D02-4024-87BA-8DF676272858/data/Containers/Data/Application/EF24108F-6D6F-4CF6-86EE-D2A7B52F0CB5/Documents/counter.txt
    // Write the file
    return file.writeAsString('$task\n', mode: FileMode.append);
  }



  @override
  Widget build(BuildContext context) {
   

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
            MaterialPageRoute(builder: (context) => TaskTitle()),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }
}