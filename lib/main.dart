import 'dart:ui_web';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recourse/pages/course_builder_page.dart';
import 'package:recourse/pages/course_selector_page.dart';
import 'package:recourse/pages/curriculum_builder_page.dart';
import 'package:recourse/pages/section_builder_page.dart';
import 'package:recourse/pages/student_course_visualizer_page.dart';
import 'package:recourse/pages/student_sign_in_page.dart';
import 'package:recourse/pages/course_builder_page.dart';
import 'package:recourse/pages/section_builder_page.dart';
import 'classes/course_section.dart';
import 'pages/pages.dart';
import 'widgets/widgets.dart';
import 'classes/course.dart';
import 'pages/course_builder_page.dart';
import 'classes/curriculum.dart';

void main() {
  runApp(ReCourse());
}

class ReCourse extends StatelessWidget {
  const ReCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'reCourse',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 210, 210, 210)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  String pageId = 'Landing';
  List<Course> courses = <Course>[
    Course("New Course", "", "New Course", ""),
    Course(
        "CST", "116", "Intro to C++", "Students will learn the basics of C++"),
    Course("CST", "126", "Functional programming with C++",
        "Students will learn functional programming principles with C++"),
    Course("CST", "136", "OOP with C++",
        "Students will learn OOP principles with C++"),
  ];
  List<CourseSection> sections = <CourseSection>[
    CourseSection(
        "CST 116", "Intro to C++", 0, 120, {Day.monday}, "Fall", "Bob Joe"),
    CourseSection("CST 126", "Functional programming with C++", 0, 120,
        {Day.tuesday}, "Winter", "Bob Joe"),
    CourseSection(
        'CST 231', 'GUI Programming', 0, 120, {Day.monday}, "Fall", "Bob Joe"),
    CourseSection('PHY 221', 'Physics I', 60, 240, {Day.tuesday, Day.thursday},
        "Fall", "Joe Bob"),
    CourseSection(
        'CST 240', 'Linux', 540, 760, {Day.monday}, "Fall", "Billy Bob"),
  ];
  List<Curriculum> curriculumns = <Curriculum>[
    Curriculum("New Curriculum", [], []),
    Curriculum("Software Engineering Technology", [
      Course("CST", "116", "Intro to C++",
          "Students will learn the basics of C++"),
      Course("CST", "126", "Functional programming with C++",
          "Students will learn functional programming principles with C++"),
    ], []),
    Curriculum("Physics", [], []),
  ];
  List<CourseSection> studentChosenSections = <CourseSection>[];

  void changePage(String id) {
    pageId = id;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var currentPageId = appState.pageId;

    Widget page;
    switch (currentPageId) {
      case 'Landing':
        page = LandingPage();
        break;
      case 'AdminMenu':
        page = AdminMenuPage();
        break;
      case 'AdminSignIn':
        page = AdminSignInPage();
        break;
      case 'StudentMenu':
        page = StudentMenuPage();
        break;
      case 'StudentSignIn':
        page = StudentSignInPage();
        break;
      case 'StudentCourseVisualizer':
        page = StudentCourseVisualizerPage();
        break;
      case 'CourseBuilder':
        page = CourseBuilderPage();
        break;
      case 'SectionBuilder':
        page = SectionBuilderPage();
        break;
      case 'CurriculumBuilder':
        page = CurriculumBuilderPage();
        break;
      case 'CourseSelector':
        page = CourseSelectorPage();
        break;
      default:
        throw UnimplementedError('no widget for $currentPageId');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
