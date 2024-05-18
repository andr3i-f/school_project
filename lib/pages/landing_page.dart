import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/widgets.dart';

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
              height: 16,
            ),
            Text('Scheduling and registration made easy.',
                style: GoogleFonts.lato().copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                )),
            SizedBox(
              height: 64,
            ),
            //User-type buttons
            Row(
              children: [
                GridButton(
                  path: 'assets/images/studentIcon.png',
                  label: 'Student',
                  fn: () => {appState.changePage('StudentSignIn')},
                ),
                SizedBox(width: 10),
                GridButton(
                  path: 'assets/images/adminIcon.png',
                  label: 'Administrator',
                  fn: () => {appState.changePage('AdminSignIn')},
                ),
              ],
            )
          ]),
        ],
      ));
    });
  }
}
