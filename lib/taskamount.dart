import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './main.dart';
import './task.dart';


class TaskAmount extends StatelessWidget {

  Task newTask;
  var controller = TextEditingController();

  TaskAmount(Task newTask){
    this.newTask = newTask;
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add an amount "),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => print("Going next"),
          ),
        ],
      ),
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    prefix: Text("\$"),
                    labelText:"Pledge an amount", 
                ),
             
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          this.newTask.amount = int.parse(controller.text);
          print("Full newTask information: title: " + this.newTask.title + ", description: " + this.newTask.description + ", amount: " + this.newTask.amount.toString());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(newTask)),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
      
    );
  }
}