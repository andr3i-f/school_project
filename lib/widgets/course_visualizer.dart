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
          ScheduleColumn(
            name: 'Time',
          ),
          ScheduleColumn(
            name: 'Monday',
          ),
          ScheduleColumn(
            name: 'Tuesday',
          ),
          ScheduleColumn(
            name: 'Wednesday',
          ),
          ScheduleColumn(
            name: 'Thursday',
          ),
          ScheduleColumn(
            name: 'Friday',
          ),
          ScheduleColumn(
            name: 'Saturday',
          ),
        ],
      )));
    });
  }
}

class ScheduleColumn extends StatelessWidget {
  const ScheduleColumn({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Row(), Row(), Row(), Row(), Text(name)],
    );
  }
}
