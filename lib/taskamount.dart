import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import './main.dart';

class TaskAmount extends StatelessWidget {

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
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    prefix: Text("\$"),
                    labelText:"Pledge an amount", 
                )
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
      
    );
  }
}