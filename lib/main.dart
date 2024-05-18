import 'dart:ui_web';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';


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

class AppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0; //Placeholder from the flutter guide

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LandingPage();
        break;
      case 1: //Nothing actually changes this value right now
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
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

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Header/ logo formatting
          Column(children: [
            SizedBox(height: 128),
            Image.asset('assets/images/logo.png', height: 128),
            SizedBox(
              height: 10,
            ),
            Text('Scheduling and registration made easy.'),
            SizedBox(
              height: 64,
            ),
            //User-type buttons
            Row(
              children: [
                GridButton(
                    path: 'assets/images/studentIcon.png', 
                    label: 'Student'
                    ),
                SizedBox(width: 10),
                GridButton(
                    path: 'assets/images/adminIcon.png',
                    label: 'Administrator'
                    ),
              ],
            )
          ]),
        ],
      ));
    });
  }
}

//Pass in an image path and a label to this to make a button
class GridButton extends StatelessWidget {
  const GridButton({
    super.key,
    required this.path,
    required this.label,
  });

  final String path;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            Color.fromARGB(255, 226, 226, 226)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        )));
    final textStyle = GoogleFonts.lato().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    );

    return Container(
      height: 256,
      width: 256,
      child: ElevatedButton(
        onPressed: () {
          print('Button');
        },
        style: buttonStyle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(path),
              Text(label, style: textStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Placeholder additional page
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var appState = context.watch<AppState>();

    return Center(
      child: Text('Placeholder'),
    );
  }
}
