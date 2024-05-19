import 'package:flutter/material.dart';
import 'package:recourse/main.dart';

class CourseVisualizer extends StatelessWidget {
  const CourseVisualizer({
    required this.appState,
    required this.textStyle,
    // Pass in a list to CourseSections
  });

  final AppState appState;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Time')],
          ),
          Column(children: [Row(), Row(), Row(), Row(), Text('Monday')]),
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Tuesday')],
          ),
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Wednesday')],
          ),
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Thursday')],
          ),
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Friday')],
          ),
          Column(
            children: [Row(), Row(), Row(), Row(), Text('Saturday')],
          ),
        ],
      )));
    });
  }
}
