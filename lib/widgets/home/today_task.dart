import 'package:flutter/material.dart';

class TodayTask extends StatefulWidget {
  @override
  _TodayTaskState createState() => _TodayTaskState();
}

class _TodayTaskState extends State<TodayTask> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Today',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
