import 'dart:ui_web';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recourse/pages/student_sign_in_page.dart';

import 'pages/pages.dart';
import 'widgets/widgets.dart';

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
