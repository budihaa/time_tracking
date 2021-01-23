import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeTimer extends StatefulWidget {
  @override
  _HomeTimerState createState() => _HomeTimerState();
}

class _HomeTimerState extends State<HomeTimer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFF070417),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:32:11',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    icon: new Icon(
                      Icons.keyboard_arrow_right,
                      size: 36.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      size: 15.0,
                      spinnerMode: true,
                      spinnerDuration: 2500,
                      animationEnabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    'Rasion Project',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
