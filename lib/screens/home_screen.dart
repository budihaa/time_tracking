import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        elevation: 0,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey[500],
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
    );
  }
}
