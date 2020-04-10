import 'package:flutter/material.dart';

import './taskdescription.dart';

class TaskTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a title"),
      ),
      body: Row(
        children: <Widget>[
          Text("add your title here"),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskDescription()),
              );
            },
            child: Text("Confirm task title"),
          ),
        ],
      ),
    );
  }
}