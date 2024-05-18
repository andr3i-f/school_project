import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import 'style.dart';

class StudentSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final textStyle = GoogleFonts.lato().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    );

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Header/ logo formatting
          Column(children: [
            SizedBox(height: 64),
            Image.asset('assets/images/logo.png', height: 64),
            SizedBox(
              height: 48,
            ),
            LoginBox(
                textStyle: textStyle,
                appState: appState,
                title: 'Student Login',
                fn: () => {appState.changePage('StudentMenu')}),
          ]),
        ],
      ));
    });
  }
}
