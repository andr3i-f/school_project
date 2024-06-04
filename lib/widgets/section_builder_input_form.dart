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
  List<Day> days = <Day>[
    Day.monday,
    Day.tuesday,
    Day.wednesday,
    Day.thursday,
    Day.friday,
    Day.saturday,
  ];
  Set<Day> selectedDay = <Day>{Day.monday};
  late CourseSection currentSection = appState.sections[0];

  late Course _selectedCourse;
  late String _selectedTerm;
  late CourseSection _selectedSection;

  var courseController = new TextEditingController();
  var termController = new TextEditingController();
  var sectionController = new TextEditingController();

  var startTimeController = new TextEditingController();
  var endTimeController = new TextEditingController();
  var instructorController = new TextEditingController();

  void addSection() {
    if (_formKey.currentState!.validate() && termController.text != "") {
      var sections = appState.sections;
      if (sectionController.text == "") {
        sections.add(CourseSection(
            "${_selectedCourse.identifier} ${_selectedCourse.number}",
            _selectedCourse.name,
            double.parse(startTimeController.text),
            double.parse(endTimeController.text),
            selectedDay,
            termController.text,
            instructorController.text));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Added section!")),
        );
      } else {
        _selectedSection.term = termController.text;
        _selectedSection.instructor = instructorController.text;
        _selectedSection.startTime = double.parse(startTimeController.text);
        _selectedSection.endTime = double.parse(endTimeController.text);
        _selectedSection.days = selectedDay;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Edited section!")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Could not add section, check fields.")),
      );
    }
  }

  void deleteSection() {
    var sections = appState.sections;
    if (sectionController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Can't remove empty section!")),
      );
    } else {
      var index = 0;
      for (var section in sections) {
        if ("${section.id}" == "${_selectedSection.id}") {
          break;
        }
        index += 1;
      }
      sections.removeAt(index);

      termController.clear();
      sectionController.clear();
      startTimeController.clear();
      endTimeController.clear();
      instructorController.clear();
      selectedDay = <Day>{Day.monday};

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Removed section!")),
      );
    }
  }

  @override
  build(BuildContext context) {
    var courses = appState.courses;
    var sections = appState.sections;
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
                  controller: courseController,
                  width: 200,
                  hintText: "Select Course",
                  dropdownMenuEntries: courses
                      .where(
                          (Course course) => course.identifier != "New Course")
                      .map((Course course) {
                    return DropdownMenuEntry<Course>(
                        value: course,
                        label: "${course.identifier} ${course.number}");
                  }).toList(),
                  onSelected: (Course? course) {
                    setState(() {
                      _selectedCourse = course!;
                      termController.text = "Fall";
                      sectionController.clear();
                      startTimeController.clear();
                      endTimeController.clear();
                      instructorController.clear();
                      selectedDay = <Day>{Day.monday};
                    });
                  },
                ),
                SizedBox(width: 25),
                DropdownMenu<String>(
                  initialSelection: "Fall",
                  controller: termController,
                  width: 200,
                  hintText: "Select Term",
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Fall", label: "Fall"),
                    DropdownMenuEntry(value: "Winter", label: "Winter"),
                    DropdownMenuEntry(value: "Spring", label: "Spring"),
                    DropdownMenuEntry(value: "Summer", label: "Summer"),
                  ],
                  onSelected: (String? term) {
                    setState(() {
                      _selectedTerm = term!;
                    });
                  },
                ),
                SizedBox(width: 25),
                DropdownMenu<CourseSection>(
                  controller: sectionController,
                  width: 200,
                  hintText: "Select Section",
                  dropdownMenuEntries: sections.map((CourseSection section) {
                    return DropdownMenuEntry<CourseSection>(
                        value: section,
                        label: "${section.id!} - ${section.term}");
                  }).toList(),
                  onSelected: (CourseSection? section) {
                    setState(() {
                      courseController.clear();
                      _selectedSection = section!;
                      termController.text = section.term!;
                      startTimeController.text = "${section.startTime}";
                      endTimeController.text = "${section.endTime}";
                      instructorController.text = "${section.instructor}";
                      selectedDay = section.days!;
                    });
                  },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter a start time";
                      }
                      return null;
                    },
                    controller: startTimeController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter an end time";
                      }
                      return null;
                    },
                    controller: endTimeController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter instructor name";
                      }
                      return null;
                    },
                    controller: instructorController,
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
                Spacer(),
                SegmentedButton<Day>(
                  multiSelectionEnabled: true,
                  emptySelectionAllowed: true,
                  segments: days.map<ButtonSegment<Day>>((Day? day) {
                    return ButtonSegment<Day>(
                        value: day!,
                        label: Text(
                            "${day.toString().substring(4, 5).toUpperCase()}${day.toString().substring(5)}"));
                  }).toList(),
                  selected: selectedDay,
                  showSelectedIcon: false,
                  onSelectionChanged: (Set<Day> newSelection) {
                    setState(() {
                      selectedDay = newSelection;
                      print(selectedDay);
                    });
                  },
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 25),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                  ),
                  onPressed: addSection,
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
                    onPressed: deleteSection,
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
