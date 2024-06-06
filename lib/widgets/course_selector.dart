import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/classes/course_section.dart';
import '../classes/course.dart';
import '../classes/requisites.dart';
import '../classes/course_section.dart';

class CourseSelectorState extends StatefulWidget {
  CourseSelectorState({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  CourseSelector createState() {
    return CourseSelector(appState: appState);
  }
}

class CourseSelector extends State<CourseSelectorState> {
  CourseSelector({
    required this.appState,
  });

  final AppState appState;

  @override
  build(BuildContext context) {
    var sections = appState.sections;
    var studentSections = appState.studentChosenSections;
    return SizedBox(
        width: 1000,
        height: 800,
        child: Column(
          children: [
            Container(
              color: Colors.grey[200],
              width: 1000,
              height: 250,
              child: Column(
                children: [
                  Text(
                    "Selected Courses",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < studentSections.length; ++i)
                        TextButton(
                            onPressed: () {
                              setState(() {
                                studentSections.removeAt(i);
                              });
                            },
                            child: CourseSectionCard(
                              appState: appState,
                              index: i,
                            ))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 1000,
                height: 540,
                child: Row(
                  children: [
                    Container(
                        color: Colors.grey[200],
                        width: 150,
                        height: 540,
                        child: Column(
                          children: [
                            Text(
                              "Filters",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            )
                          ],
                        )),
                    SizedBox(width: 10),
                    Container(
                        color: Colors.grey[200],
                        width: 840,
                        height: 540,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Available Courses",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(height: 10),
                            for (int i = 0; i < sections.length / 4; ++i)
                              Row(
                                children: [
                                  for (int x = 0; x < 4; ++x)
                                    (x + (i * 4)) < sections.length
                                        ? TextButton(
                                            onPressed: () {
                                              setState(() {
                                                studentSections.add(
                                                    CourseSection(
                                                        sections[(x + (i * 4))]
                                                            .id,
                                                        sections[(x + (i * 4))]
                                                            .name,
                                                        sections[(x + (i * 4))]
                                                            .startTime,
                                                        sections[(x + (i * 4))]
                                                            .endTime,
                                                        sections[(x + (i * 4))]
                                                            .days,
                                                        sections[(x + (i * 4))]
                                                            .term,
                                                        sections[(x + (i * 4))]
                                                            .instructor));
                                              });
                                            },
                                            child: CourseSectionCard(
                                              appState: appState,
                                              index: (x + (i * 4)),
                                            ))
                                        : Container(),
                                ],
                              ),
                          ],
                        ))
                  ],
                )),
          ],
        ));
  }
}

class CourseSectionCard extends StatelessWidget {
  CourseSectionCard({
    required this.appState,
    required this.index,
  });

  final AppState appState;
  final int index;
  @override
  Widget build(BuildContext) {
    var sections = appState.sections;

    return Container(
      width: 180,
      height: 180,
      color: Colors.grey[300],
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Text("Course", style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5,
          ),
          Text("${sections[index].id}"),
          Text("${sections[index].instructor}"),
          Text("${sections[index].startTime} - ${sections[index].endTime}"),
        ],
      ),
    );
  }
}
