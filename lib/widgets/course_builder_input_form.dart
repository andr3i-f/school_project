import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/course_classes.dart';

class CourseBuilderForm extends StatefulWidget {
  const CourseBuilderForm({
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
  String? currentCourse = "New Course";
  List<String> courses = <String>[
    "New Course",
    "CST 116",
    "CST 126",
    "CST 136"
  ];

  var courseIdentifierController = new TextEditingController();
  var courseNumberController = new TextEditingController();
  var courseNameController = new TextEditingController();
  var courseDescriptionController = new TextEditingController();
  var courseMinimumGradeController = new TextEditingController();

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
                  DropdownMenu<String>(
                    initialSelection: currentCourse,
                    dropdownMenuEntries: courses.map((String course) {
                      return DropdownMenuEntry<String>(
                          value: course, label: course);
                    }).toList(),
                    onSelected: (String? course) {
                      setState(() {
                        currentCourse = course;
                        if (course != "New Course") {
                          courseIdentifierController.text = course!;
                          courseNumberController.text = course;
                          courseNameController.text = course;
                          courseDescriptionController.text = course;
                        } else {
                          courseIdentifierController.text = "";
                          courseNumberController.text = "";
                          courseNameController.text = "";
                          courseDescriptionController.text = "";
                        }
                      });
                      print(currentCourse);
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
                        onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Added course!")),
                                  )
                                }
                            }),
                  ),
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
                    DropdownMenu<String>(
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                            value: "Third Entry", label: "Third Entry"),
                        DropdownMenuEntry(
                            value: "Fourth Entry", label: "Fourth Entry"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Minimum Grade",
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
                            onPressed: () => {print("add button")},
                            child: Text("Add Coreq")),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[400]),
                            onPressed: () => {print("add button")},
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
