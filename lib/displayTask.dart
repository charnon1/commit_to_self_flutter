import 'package:flutter/material.dart';

import "./task.dart";

class DisplayTask extends StatelessWidget {

    Task newTask = new Task("","","",0);

    DisplayTask(Task newTask){
        this.newTask = newTask;
    } 

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(this.newTask.title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                        Text("title: " + this.newTask.title),
                        Text("description: " + this.newTask.description),
                        Text("amount: " + this.newTask.amount.toString()),
                    ],
                ),
            ),
        );
    }         
}

