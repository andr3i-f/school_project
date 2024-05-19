import 'package:flutter/material.dart';
import 'package:recourse/main.dart';

class CourseVisualizer extends StatelessWidget {
  const CourseVisualizer({
    required this.appState,
    required this.textStyle,
    required this.courses,
  });

  final AppState appState;
  final TextStyle textStyle;
  final List<String> courses;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ScheduleColumn(
            name: 'Time',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Monday',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Tuesday',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Wednesday',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Thursday',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Friday',
            courses: courses,
          ),
          ScheduleColumn(
            name: 'Saturday',
            courses: courses,
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
    required this.courses,
  });

  final String name;
  final List<String> courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var course in courses)
          if (course == name) Text(course),
        Text(name),
      ],
    );
  }
}
