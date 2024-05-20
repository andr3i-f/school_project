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
          body: (Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TimeColumn(),
            Spacer(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
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
        )
      ])));
    });
  }
}

class TimeColumn extends StatelessWidget {
  const TimeColumn({
    super.key,
  });

  final String name = "Time";
  final double width = 1400;
  final double height = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Spacer(),
        ),
        Expanded(
          child: Row(children: [
            Text("7:00 AM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
            child: Row(
          children: [
            Text("8:00 AM"),
            Container(width: width, height: height, color: Colors.black),
          ],
        )),
        Expanded(
          child: Row(children: [
            Text("9:00 AM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("10:00 AM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("11:00 AM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("12:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("1:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("2:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("3:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("4:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("5:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("6:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("7:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("8:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("9:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
        ),
        Expanded(
          child: Row(children: [
            Text("10:00 PM"),
            Container(width: width, height: height, color: Colors.black),
          ]),
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
