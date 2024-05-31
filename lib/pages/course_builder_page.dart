import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import 'style.dart';

class CourseBuilderPage extends StatelessWidget {
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
          children: [
            Column(
              children: [
                TextButton(
                    onPressed: () => appState.changePage('AdminMenu'),
                    child: Text("Back")),
              ],
            ),
            Column(
              children: [
                Container(
                    width: 200,
                    height: 100,
                    color: Colors.blue[50],
                    child: Column(
                      children: [
                        Text("Currently Selected Course"),
                        DropdownMenu<String>(
                          dropdownMenuEntries: [
                            DropdownMenuEntry(
                                value: "New Entry", label: "New Entry"),
                            DropdownMenuEntry(
                                value: "Second Entry", label: "Second Entry"),
                          ],
                        )
                      ],
                    ))
              ],
            ),
            Column(),
          ],
        ),
      );
    });
  }
}
