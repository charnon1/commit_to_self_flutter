import 'package:flutter/material.dart';

import './taskamount.dart';

class TaskDueDate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a due date"),
      ),
      body: Row(
        children: <Widget>[
          Text("add your due date here"),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskAmount()),
              );
            },
            child: Text("Confirm due date"),
          ),
        ],
      ),
    );
  }
}