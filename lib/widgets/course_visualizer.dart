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
        children: <Widget>[
          TimeColumn(),
          VerticalDivider(
            color: Colors.black,
          ),
          ScheduleColumn(
            name: 'Monday',
            courses: courses,
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          ScheduleColumn(
            name: 'Tuesday',
            courses: courses,
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          ScheduleColumn(
            name: 'Wednesday',
            courses: courses,
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          ScheduleColumn(
            name: 'Thursday',
            courses: courses,
          ),
          VerticalDivider(
            color: Colors.black,
          ),
          ScheduleColumn(
            name: 'Friday',
            courses: courses,
          ),
          VerticalDivider(
            color: Colors.black,
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

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    super.key,
  });

  final String name = "Time";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Spacer(),
        ),
        Expanded(
          child: Text("7:00 AM"),
        ),
        Expanded(
          child: Text("8:00 AM"),
        ),
        Expanded(
          child: Text("9:00 AM"),
        ),
        Expanded(
          child: Text("10:00 AM"),
        ),
        Expanded(
          child: Text("11:00 AM"),
        ),
        Expanded(
          child: Text("12:00 PM"),
        ),
        Expanded(
          child: Text("1:00 PM"),
        ),
        Expanded(
          child: Text("2:00 PM"),
        ),
        Expanded(
          child: Text("3:00 PM"),
        ),
        Expanded(
          child: Text("4:00 PM"),
        ),
        Expanded(
          child: Text("5:00 PM"),
        ),
        Expanded(
          child: Text("6:00 PM"),
        ),
        Expanded(
          child: Text("7:00 PM"),
        ),
        Expanded(
          child: Text("8:00 PM"),
        ),
        Expanded(
          child: Text("9:00 PM"),
        ),
        Expanded(
          child: Text("10:00 PM"),
        ),
        Spacer(),
        Text(name),
      ],
    );
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
        Spacer(),
        Text(name),
      ],
    );
  }
}
