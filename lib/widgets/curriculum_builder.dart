import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/classes/course_section.dart';
import '../classes/course.dart';
import '../classes/curriculum.dart';

class CurriculumBuilderForm extends StatefulWidget {
  CurriculumBuilderForm({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  CurriculumBuilderFormState createState() {
    return CurriculumBuilderFormState(appState: appState);
  }
}

class CurriculumBuilderFormState extends State<CurriculumBuilderForm> {
  CurriculumBuilderFormState({
    required this.appState,
  });

  final AppState appState;
  final _formKey = GlobalKey<FormState>();

  late var currentCurriculum;
  late var currentCourse;

  bool selectedCurriculum = false;
  bool selectedCourse = false;
  bool actualCurriculum = false;

  var curriculumController = new TextEditingController();
  var curriculumNameController = new TextEditingController();

  Course findCourse(String name, List<Course> courses) {
    for (var course in courses) {
      if ("${course.identifier}${course.number}" == name) {
        return course;
      }
    }
    return courses[0]; // Will never hit this return
  }

  void addCurriculum() {
    var curr = appState.curriculumns;
    print(currentCurriculum.name);
    if (selectedCurriculum == true) {
      if (currentCurriculum.name == "New Curriculum") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Added curriculum!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Edited curriculum!")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Select curriculum")),
      );
    }
  }

  void deleteCurriculum() {}

  @override
  build(BuildContext context) {
    var curriculumns = appState.curriculumns;
    var courses = appState.courses;
    return Form(
        key: _formKey,
        child: Row(
          children: [
            SizedBox(
              width: 600,
              height: 800,
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text("Currently Selected Curriculum: ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownMenu<Curriculum>(
                    width: 400,
                    controller: curriculumController,
                    dropdownMenuEntries: curriculumns.map((Curriculum curr) {
                      return DropdownMenuEntry(value: curr, label: curr.name!);
                    }).toList(),
                    onSelected: (Curriculum? curr) {
                      setState(() {
                        currentCurriculum = curr!;
                        selectedCourse = false;
                        currentCourse = null;
                        selectedCurriculum = true;

                        if (curr.name == "New Curriculum") {
                          curriculumNameController.text = "";
                          actualCurriculum = false;
                        } else {
                          curriculumNameController.text = "${curr.name}";
                          actualCurriculum = true;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 600,
                    height: 500,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        Text("Curriculum",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter name of curriculum";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Curriculum Name",
                            ),
                            controller: curriculumNameController,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Courses",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Required",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        if (curriculumController.text != "")
                          for (var req in currentCurriculum.required_courses!)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedCourse = true;
                                  currentCourse = findCourse(
                                      "${req.identifier}${req.number}",
                                      currentCurriculum.required_courses);
                                });
                              },
                              child: Text("${req.identifier} ${req.number}"),
                            ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Electives",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        if (curriculumController.text != "")
                          for (var req in currentCurriculum.elective_courses)
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    selectedCourse = true;
                                    currentCourse = findCourse(
                                        "${req.identifier}${req.number}",
                                        currentCurriculum.elective_courses);
                                  });
                                },
                                child: Text("${req.identifier} ${req.number}")),
                        Spacer(),
                        Row(
                          children: [
                            Spacer(),
                            DropdownMenu<Course>(
                              enabled: actualCurriculum == true ? true : false,
                              label: Text("Course"),
                              dropdownMenuEntries: courses
                                  .where((Course course) =>
                                      course.identifier != "New Course")
                                  .map((Course course) {
                                return DropdownMenuEntry<Course>(
                                    value: course,
                                    label:
                                        "${course.identifier} ${course.number}");
                              }).toList(),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[600],
                              ),
                              onPressed: () => {print('hi')},
                              child: Text("Add Required Course"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[600],
                              ),
                              onPressed: () => {print('hi')},
                              child: Text("Add Elective Course"),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              addCurriculum();
                            });
                          },
                          child: Text("Create New Curriculum"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => {print('hi')},
                          child: Text("Delete Curriciulum"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[400]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 15),
            selectedCourse == true
                ? Container(
                    height: 500,
                    width: 500,
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        SizedBox(height: 1),
                        Row(
                          children: [
                            Spacer(),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  selectedCourse = false;
                                  currentCourse = null;
                                });
                              },
                              child: Text("X"),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text("Selected Course",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(height: 15),
                        Text("Course Identifier",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "${currentCourse.identifier} ${currentCourse.number}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Course Name",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${currentCourse.name}"),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Course Description",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("${currentCourse.description}"),
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[400],
                          ),
                          onPressed: () => {print('hi')},
                          child: Text("Delete Course From Curriculum"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ));
  }
}
