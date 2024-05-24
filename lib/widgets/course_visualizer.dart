import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/course_classes.dart';

class CourseVisualizer extends StatelessWidget {
  const CourseVisualizer({
    required this.appState,
    required this.textStyle,
    required this.courses,
  });

  final AppState appState;
  final TextStyle textStyle;
  final List<CourseSection> courses;

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
              day: Day.monday,
              courses: courses,
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            ScheduleColumn(
              day: Day.tuesday,
              courses: courses,
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            ScheduleColumn(
              day: Day.wednesday,
              courses: courses,
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            ScheduleColumn(
              day: Day.thursday,
              courses: courses,
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            ScheduleColumn(
              day: Day.friday,
              courses: courses,
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            ScheduleColumn(
              day: Day.saturday,
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
        for (int i = 0; i < 16; ++i)
          Expanded(
            child: Row(children: [
              Text("${(7+i)%13 + (i >= 6 ? 1 : 0)}:00 ${i >= 5 ? 'PM' : 'AM'}"),
              Container(width: width, height: height, color: Colors.black),
            ]),
          ),
        Spacer(),
        Row(
          children: [
            Text(name),
            SizedBox(width: width),
          ],
        )
      ],
    );
  }
}

class ScheduleColumn extends StatelessWidget {
  const ScheduleColumn({
    super.key,
    required this.day,
    required this.courses,
  });

  final Day day;
  final List<CourseSection> courses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 65),
        Stack(
          fit: StackFit.loose,
          children: [
            Container(
              width: 200,
              height: 700,
            ),
            for (var course in courses)
              if (course.days!.value & day.value == day.value)
                Positioned(
                  top: course.startTime! * 0.715,
                  child: Container(
                      height: (course.endTime! - course.startTime!) * 0.715,
                      width: 200,
                      color: Color.fromARGB(100, 110, 166, 176),
                      child: Text(course.name!)),
                ),
          ],
        ),
        Spacer(),
        Text(day.toString()),
      ],
    );
  }
}
