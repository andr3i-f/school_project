import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recourse/widgets/curriculum_builder.dart';
import 'package:recourse/widgets/section_builder_input_form.dart';
import '../classes/course.dart';
import '../widgets/widgets.dart';
import 'style.dart';
import '../classes/curriculum.dart';

class CurriculumBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: () => appState.changePage('AdminMenu'),
                  child: Text("<< Back",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Spacer(),
                CurriculumBuilderForm(appState: appState),
                Spacer(),
              ],
            ),
            Spacer(),
          ],
        ),
      );
    });
  }
}
