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
  var selectedDay = <String>{};

  void sync() {
    setState(() {
      print('hi');
    });
  }

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
                        CourseSectionCard(
                          appState: appState,
                          index: i,
                          isSelected: true,
                          courseSelector: this,
                        ),
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
                            ),
                            SizedBox(height: 15),
                            DropdownMenu<String>(
                              width: 130,
                              label: Text(
                                "Term",
                                style: TextStyle(fontSize: 15),
                              ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Fall"),
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Winter"),
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Spring"),
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Summer"),
                              ],
                            ),
                            SizedBox(height: 10),
                            DropdownMenu<String>(
                              width: 130,
                              label: Text(
                                "Subject",
                                style: TextStyle(fontSize: 15),
                              ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry<String>(
                                    value: "CSET", label: "CSET"),
                                DropdownMenuEntry<String>(
                                    value: "MATH", label: "MATH"),
                                DropdownMenuEntry<String>(
                                    value: "ART", label: "ART"),
                                DropdownMenuEntry<String>(
                                    value: "BIO", label: "BIO"),
                              ],
                            ),
                            SizedBox(height: 10),
                            DropdownMenu<String>(
                              width: 130,
                              label: Text(
                                "Level",
                                style: TextStyle(fontSize: 15),
                              ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry<String>(
                                    value: "100-199", label: "100-199"),
                                DropdownMenuEntry<String>(
                                    value: "200-299", label: "200-299"),
                                DropdownMenuEntry<String>(
                                    value: "300-399", label: "300-399"),
                                DropdownMenuEntry<String>(
                                    value: "400-499", label: "400-499"),
                                DropdownMenuEntry<String>(
                                    value: "499+", label: "499+"),
                              ],
                            ),
                            SizedBox(height: 10),
                            DropdownMenu<String>(
                              width: 130,
                              label: Text(
                                "Campus",
                                style: TextStyle(fontSize: 14),
                              ),
                              dropdownMenuEntries: [
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Portland Metro"),
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Klamath Falls"),
                                DropdownMenuEntry<String>(
                                    value: "Fall", label: "Online"),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Days Taught",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 3),
                            SegmentedButton(
                                emptySelectionAllowed: true,
                                multiSelectionEnabled: true,
                                segments: [
                                  ButtonSegment<String>(
                                      value: "M",
                                      label: Text(
                                        "M",
                                        style: TextStyle(fontSize: 7),
                                      )),
                                  ButtonSegment<String>(
                                      value: "TU",
                                      label: Text(
                                        "TU",
                                        style: TextStyle(fontSize: 7),
                                      )),
                                  ButtonSegment<String>(
                                      value: "W",
                                      label: Text(
                                        "W",
                                        style: TextStyle(fontSize: 7),
                                      )),
                                  ButtonSegment<String>(
                                      value: "TH",
                                      label: Text(
                                        "TH",
                                        style: TextStyle(fontSize: 7),
                                      )),
                                  ButtonSegment<String>(
                                      value: "F",
                                      label: Text(
                                        "F",
                                        style: TextStyle(fontSize: 7),
                                      )),
                                  ButtonSegment<String>(
                                      value: "S",
                                      label: Text(
                                        "S",
                                        style: TextStyle(fontSize: 7),
                                      ))
                                ],
                                onSelectionChanged: (Set<String> newSelection) {
                                  setState(() {
                                    selectedDay = newSelection;
                                    print(selectedDay);
                                  });
                                },
                                showSelectedIcon: false,
                                selected: selectedDay)
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 275),
                                Text(
                                  "Available Courses",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 220,
                                  height: 50,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Search for courses",
                                        prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: Icon(Icons.search),
                                        )),
                                  ),
                                ),
                                SizedBox(width: 10),
                              ],
                            ),
                            SizedBox(height: 10),
                            for (int i = 0; i < sections.length / 4; ++i)
                              Row(
                                children: [
                                  for (int x = 0; x < 4; ++x)
                                    (x + (i * 4)) < sections.length
                                        ? CourseSectionCard(
                                            appState: appState,
                                            index: (x + (i * 4)),
                                            isSelected: false,
                                            courseSelector: this,
                                          )
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
    required this.isSelected,
    required this.courseSelector,
  });

  final CourseSelector courseSelector;

  final AppState appState;
  final int index;
  bool isSelected;

  void pressed() {
    var sections = appState.sections;
    var studentSections = appState.studentChosenSections;

    if (isSelected == false) {
      studentSections.add(CourseSection(
          sections[index].id,
          sections[index].name,
          sections[index].startTime,
          sections[index].endTime,
          sections[index].days,
          sections[index].term,
          sections[index].instructor));
    } else {
      studentSections.removeAt(index);
    }
    courseSelector.sync();
  }

  @override
  Widget build(BuildContext) {
    var sections = appState.sections;
    var studentSections = appState.studentChosenSections;

    var header = TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
    var body = TextStyle(
      color: Colors.black,
      fontSize: 15,
    );

    return TextButton(
      onPressed: pressed,
      child: Container(
        width: 180,
        height: 180,
        color: Colors.grey[300],
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Text("Course", style: header),
            SizedBox(
              height: 5,
            ),
            isSelected == false
                ? Text("${sections[index].id}", style: body)
                : Text("${studentSections[index].id}", style: body),
            isSelected == false
                ? Text("${sections[index].instructor}", style: body)
                : Text("${studentSections[index].instructor}", style: body),
            isSelected == false
                ? Text(
                    "${sections[index].startTime} - ${sections[index].endTime}",
                    style: body)
                : Text(
                    "${studentSections[index].startTime} - ${studentSections[index].endTime}",
                    style: body),
          ],
        ),
      ),
    );
  }
}
