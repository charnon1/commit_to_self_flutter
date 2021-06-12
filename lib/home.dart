
import 'package:commit_to_self/displayTask.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import "./task.dart";
import "./taskTitle.dart";
import "./displayTask.dart";

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
    print("path uri: " + directory.path);
    return directory.path;
  }

  // get the file where tasks are stored
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

      List<String> lines = file.readAsLinesSync();
      if (lines.length == 0) {
        print("there is currently no tasks recorded");
      }
      print("printing out lines \n:");
      for( var i = 0 ; i < lines.length; i++ ) { 
          print(lines[i]);
          var split = lines[i].split(",");
          var _title = split[0];
          var _description = split[1];
          var _dueDate = split[2];
          var _amount = int.parse(split[3]);
          Task newTask = new Task(_title, _description, _dueDate, _amount);
          tasks.add(newTask);
      } 
      print("the length of tasks in read tasks: " + tasks.length.toString());
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

  displayTask(Task task){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayTask(task)),);
  }

  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Commit to Self"),
            ),
            body: FutureBuilder<List<Task>>(
                future: readTasks(),
                builder:(context, snapshot){
                    if(snapshot.hasData ){
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index){
                                return Container(
                                    height: 50,
                                    child: Card(
                                        shape: RoundedRectangleBorder(  
                                            borderRadius: BorderRadius.circular(15.0),  
                                        ),  
                                        elevation: 5,
                                        child:  Text(snapshot.data[index].title),
                                    ),
                                );
                            },
                        );
                    }
                    return Container(child: Text("no tasks"),);
                }
            ),
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