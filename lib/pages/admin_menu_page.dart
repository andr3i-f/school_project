import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';

import '../widgets/widgets.dart';

class AdminMenuPage extends StatelessWidget {
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
                  path: 'assets/images/adminIcon.png',
                  label: 'Return home',
                  fn: () => {appState.changePage('Landing')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Course Builder',
                  fn: () => {appState.changePage('CourseBuilder')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Section Builder',
                  fn: () => {appState.changePage('SectionBuilder')},
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              // Bottom row
              children: [
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Curriculum Builder',
                  fn: () => {appState.changePage('CurriculumBuilder')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Placeholder2',
                  fn: () => {print('Placeholder pressed')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Placeholder3',
                  fn: () => {print('Placeholder pressed')},
                ),
              ],
            )
          ]),
        ],
      ));
    });
  }
}
