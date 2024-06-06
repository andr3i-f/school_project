import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';

import '../widgets/widgets.dart';

class StudentMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Header/ logo formatting
          Column(children: [
            SizedBox(height: 64),
            Image.asset('assets/images/logo.png', height: 64),
            SizedBox(
              height: 64,
            ),
            //User-type buttons
            Row(
              //Top row
              children: [
                GridButton(
                  path: 'assets/images/studentIcon.png',
                  label: 'Return home',
                  fn: () => {appState.changePage('Landing')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/studentIcon.png',
                  label: 'Course Selector',
                  fn: () => {appState.changePage('CourseSelector')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/studentIcon.png',
                  label: 'Schedule Visualizer',
                  fn: () => {appState.changePage('StudentCourseVisualizer')},
                ),
              ],
            ),
          ]),
        ],
      ));
    });
  }
}
