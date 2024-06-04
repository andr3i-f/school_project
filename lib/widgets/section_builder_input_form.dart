import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/classes/course_section.dart';
import '../classes/course.dart';
import '../classes/requisites.dart';

class SectionBuilderForm extends StatefulWidget {
  SectionBuilderForm({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  SectionBuilderFormState createState() {
    return SectionBuilderFormState(appState: appState);
  }
}

class SectionBuilderFormState extends State<SectionBuilderForm> {
  SectionBuilderFormState({
    required this.appState,
  });
  final AppState appState;
  final _formKey = GlobalKey<FormState>();
  List<String> days = <String>[
    "Monday",
    "Tuesday",
    "Wednesnday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  Set<String> selectedDay = <String>{"Monday"};

  @override
  build(BuildContext context) {
    var courses = appState.courses;
    return Form(
      key: _formKey,
      child: SizedBox(
        width: 700,
        height: 800,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 25),
                DropdownMenu<Course>(
                    width: 200,
                    hintText: "Select Course",
                    dropdownMenuEntries: courses
                        .where((Course course) =>
                            course.identifier != "New Course")
                        .map((Course course) {
                      return DropdownMenuEntry<Course>(
                          value: course,
                          label: "${course.identifier} ${course.number}");
                    }).toList()),
                SizedBox(width: 25),
                DropdownMenu<String>(
                  width: 200,
                  hintText: "Select Term",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Fall", label: "Fall"),
                    DropdownMenuEntry(value: "Winter", label: "Winter"),
                    DropdownMenuEntry(value: "Spring", label: "Spring"),
                    DropdownMenuEntry(value: "Summer", label: "Summer"),
                  ],
                ),
                SizedBox(width: 25),
                DropdownMenu<String>(
                  width: 200,
                  hintText: "Select Section",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Third", label: "Third"),
                    DropdownMenuEntry(value: "Fourth", label: "Fourth"),
                  ],
                ),
                SizedBox(width: 25),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Start Time",
                      helperText: "Time ex: 00:00",
                    ),
                  ),
                ),
                SizedBox(width: 50),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "End Time",
                      helperText: "Time ex: 13:00",
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Instructor",
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(width: 25),
                SegmentedButton<String>(
                  multiSelectionEnabled: true,
                  emptySelectionAllowed: true,
                  segments: days.map<ButtonSegment<String>>((String day) {
                    return ButtonSegment<String>(value: day, label: Text(day));
                  }).toList(),
                  selected: selectedDay,
                  showSelectedIcon: false,
                  onSelectionChanged: (Set<String> newSelection) {
                    setState(() {
                      selectedDay = newSelection;
                      print(selectedDay);
                    });
                  },
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: () => {print('hi')},
                  child: Text("Create New Section"),
                ),
              ),
            ]),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                    onPressed: () => {print('hi 2')},
                    child: Text("Delete Section"),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
