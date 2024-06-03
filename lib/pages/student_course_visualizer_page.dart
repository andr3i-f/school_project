import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';
import 'package:recourse/course_classes.dart';

class StudentCourseVisualizerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final textStyle = GoogleFonts.lato().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: (Column(
        children: [
          Row(children: [
            TextButton(
                onPressed: () => appState.changePage('StudentMenu'),
                child: Text('Back'))
          ]),
          Expanded(
            child: CourseVisualizer(
              appState: appState,
              textStyle: textStyle,
              courses: [
                CourseSection('CST231', 'GUI Programming', 0, 120, Day.monday),
                CourseSection('PHYS221', 'Physics I', 60, 240, Day.monday),
                CourseSection('CST240', 'Linux', 540, 760, Day.monday)
              ], // testing
            ),
          ),
        ],
      )));
    });
  }
}
