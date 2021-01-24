import 'package:flutter/material.dart';
import 'package:time_tracking/widgets/home/home_timer.dart';
import 'package:time_tracking/widgets/home/today_task.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 0,
          ),
          child: Text(
            'Task',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
            ),
          ),
        ),
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
      body: Column(
        children: [
          HomeTimer(),
          TodayTask(),
        ],
      ),
    );
  }
}
