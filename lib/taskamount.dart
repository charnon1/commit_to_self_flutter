import 'package:flutter/material.dart';

import './main.dart';

class TaskAmount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text("Add an amount "),
      ),
      body: Row(
        children: <Widget>[
          Text("add your amount here"),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
            child: Text("Confirm amount"),
          ),
        ],
      ),
    );
  }
}