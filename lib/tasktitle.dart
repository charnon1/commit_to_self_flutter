import 'package:flutter/material.dart';

import './taskdescription.dart';
import './task.dart';

class TaskTitle extends StatelessWidget {

  Task newTask = Task("","","",0);
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a title"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => print("Going next"),
          ),
        ],
      ),
      body: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: Container(child: 
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Title:",
              ),
            ),
            
            width: MediaQuery.of(context).size.width/2,
          ),),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.newTask.title = controller.text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskDescription(this.newTask)),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
      
    );
  }
}