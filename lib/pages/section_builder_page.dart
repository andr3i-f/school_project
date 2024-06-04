import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recourse/widgets/section_builder_input_form.dart';
import '../classes/course.dart';
import '../widgets/widgets.dart';
import 'style.dart';

class SectionBuilderPage extends StatelessWidget {
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
                    child: Text("<< Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Text("Section Builder",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                SizedBox(
                  height: 25,
                ),
                SectionBuilderForm(appState: appState),
              ],
            ),
            Spacer(),
          ],
        ),
      );
    });
  }
}
