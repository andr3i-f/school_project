import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/course_classes.dart';
import '../classes/course.dart';
import '../classes/requisites.dart';

class CourseBuilderForm extends StatefulWidget {
  CourseBuilderForm({
    super.key,
    required this.appState,
  });

  final AppState appState;

  @override
  CourseBuilderFormState createState() {
    return CourseBuilderFormState();
  }
}

class CourseBuilderFormState extends State<CourseBuilderForm> {
  final _formKey = GlobalKey<FormState>();
  List<Course> courses = <Course>[
    Course("New Course", "", "New Course", ""),
    Course(
        "CST", "116", "Intro to C++", "Students will learn the basics of C++"),
    Course("CST", "126", "Functional programming with C++",
        "Students will learn functional programming principles with C++"),
    Course("CST", "136", "OOP with C++",
        "Students will learn OOP principles with C++"),
  ];

  late Course currentCourse = courses[0];
  late Course reqCourse;

  var courseIdentifierController = new TextEditingController();
  var courseNumberController = new TextEditingController();
  var courseNameController = new TextEditingController();
  var courseDescriptionController = new TextEditingController();
  var courseMinimumGradeController = new TextEditingController();
  var requisiteController = new TextEditingController();

  void findCourse() {
    bool found = false;
    int index = 0;
    if (_formKey.currentState!.validate()) {
      for (var course in courses) {
        if ("${course.identifier} ${course.number}" ==
            "${courseIdentifierController.text} ${courseNumberController.text}") {
          found = true;
          break;
        }
        index += 1;
      }

      if (found) {
        courses[index] = Course(
            courseIdentifierController.text,
            courseNumberController.text,
            courseNameController.text,
            courseDescriptionController.text);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Edited course!")),
        );
      } else {
        courses.add(Course(
            courseIdentifierController.text,
            courseNumberController.text,
            courseNameController.text,
            courseDescriptionController.text));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Added course!")),
        );
      }
    }
  }

  @override
  build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Row(children: [
          SizedBox(
            height: 800,
            width: 500,
            child: Column(children: [
              Column(
                children: [
                  Text("Currently Selected Course"),
                  DropdownMenu<Course>(
                    initialSelection: currentCourse,
                    dropdownMenuEntries: courses.map((Course course) {
                      return DropdownMenuEntry<Course>(
                          value: course,
                          label: "${course.identifier} ${course.number}");
                    }).toList(),
                    onSelected: (Course? course) {
                      setState(() {
                        currentCourse = course!;
                        if (course.name != "New Course") {
                          courseIdentifierController.text = course.identifier!;
                          courseNumberController.text = course.number!;
                          courseNameController.text = course.name!;
                          courseDescriptionController.text =
                              course.description!;
                          requisiteController.clear();
                        } else {
                          courseIdentifierController.text = "";
                          courseNumberController.text = "";
                          courseNameController.text = "";
                          courseDescriptionController.text = "";
                          courseMinimumGradeController.text = "";
                          requisiteController.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter course identifier";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Course Identifier",
                        helperText: "Course Identifier (i.e. CST)",
                      ),
                      controller: courseIdentifierController,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter course number (i.e. 136)";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Course Number",
                        helperText: "Course Number (i.e. 136)",
                      ),
                      controller: courseNumberController,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter name of course";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Course Name",
                        helperText:
                            "Enter name of the course (i.e. Intro to Business)",
                      ),
                      controller: courseNameController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 500,
                    height: 200,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the description of the course";
                        }
                        return null;
                      },
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Description",
                        helperText:
                            "Description (ex. 'Students will learn the basics of . . .')",
                      ),
                      controller: courseDescriptionController,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                    ),
                    child: Text("Create New Course"),
                    onPressed: findCourse,
                  ))
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[400],
                        ),
                        child: Text("Delete Course"),
                        onPressed: () => {print("hi")}),
                  ),
                ],
              )
            ]),
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 800,
            width: 500,
            child: Column(
              children: [
                Column(
                  children: [
                    Text("Add prerequisites / corequisites"),
                    DropdownMenu<Course>(
                      controller: requisiteController,
                      enabled: currentCourse.identifier == "New Course"
                          ? false
                          : true,
                      dropdownMenuEntries: courses
                          .where((Course course) =>
                              course.identifier != "New Course")
                          .map((Course course) {
                        return DropdownMenuEntry<Course>(
                            value: course,
                            label: "${course.identifier} ${course.number}");
                      }).toList(),
                      onSelected: (Course? course) {
                        setState(() {
                          reqCourse = course!;
                        });
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        controller: courseMinimumGradeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Minimum Grade",
                          helperText: "Optional",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400]),
                            onPressed: () => {
                                  if (currentCourse.identifier != "New Course")
                                    {
                                      if (courseMinimumGradeController.text ==
                                          "")
                                        {
                                          currentCourse.coreqs.add(Requisite(
                                            reqCourse.identifier,
                                            reqCourse.number,
                                            0,
                                          ))
                                        }
                                      else
                                        {
                                          currentCourse.coreqs.add(Requisite(
                                            reqCourse.identifier,
                                            reqCourse.number,
                                            int.parse(
                                                courseMinimumGradeController
                                                    .text),
                                          ))
                                        }
                                    }
                                },
                            child: Text("Add Coreq")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400]),
                            onPressed: () => {
                                  if (currentCourse.identifier != "New Course")
                                    {
                                      if (courseMinimumGradeController.text ==
                                          "")
                                        {
                                          currentCourse.prereqs.add(Requisite(
                                            reqCourse.identifier,
                                            reqCourse.number,
                                            0,
                                          ))
                                        }
                                      else
                                        {
                                          currentCourse.prereqs.add(Requisite(
                                            reqCourse.identifier,
                                            reqCourse.number,
                                            int.parse(
                                                courseMinimumGradeController
                                                    .text),
                                          ))
                                        }
                                    }
                                },
                            child: Text("Add Prereq")),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      height: 300,
                      width: 150,
                      color: Colors.red[50],
                      child: Column(children: [
                        Text("Corequisites"),
                        for (var req in currentCourse.coreqs)
                          if (req.minimumGrade == 0)
                            Text("${req.identifier} ${req.number}")
                          else
                            Text(
                                "${req.identifier} ${req.number} : ${req.minimumGrade}"),
                      ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 300,
                      width: 150,
                      color: Colors.blue[50],
                      child: Column(
                        children: [
                          Text("Prerequisites"),
                          for (var req in currentCourse.prereqs)
                            if (req.minimumGrade == 0)
                              Text("${req.identifier} ${req.number}")
                            else
                              Text(
                                  "${req.identifier} ${req.number} : ${req.minimumGrade}"),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ]));
  }
}
