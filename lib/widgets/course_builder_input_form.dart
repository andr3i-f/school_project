import 'package:flutter/material.dart';
import 'package:recourse/main.dart';
import 'package:recourse/course_classes.dart';

class CourseBuilderInputForm extends StatelessWidget {
  const CourseBuilderInputForm({
    required this.appState,
  });

  final AppState appState;

  @override
  build(BuildContext context) {
    return Form(
        child: Row(children: [
      SizedBox(
        height: 500,
        width: 500,
        child: Column(children: [
          Row(children: [
            Column(
              children: [
                Text("Currently Selected Course"),
                DropdownMenu<String>(
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "New Entry", label: "New Entry"),
                    DropdownMenuEntry(
                        value: "Other Entry", label: "Other Entry")
                  ],
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Course Identifier")),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Course Number")),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name of course (ex. Intro to Business)"),
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
                  child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:
                        "Description (ex. 'Students will learn the basics of . . .')"),
              ))
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
                    onPressed: () => {print("hi")}),
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
        height: 500,
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
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Minimum Grade? "),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
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
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 300,
                  width: 150,
                  color: Colors.red[50],
                  child: Column(children: [
                    Text("Prerequisites"),
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
                        Text("Corequisites"),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
