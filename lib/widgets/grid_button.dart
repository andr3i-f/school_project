import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridButton extends StatelessWidget {
  const GridButton({
    super.key,
    required this.path,
    required this.label,
    required this.fn,
  });

  final String path;
  final String label;
  final Function fn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonStyle = ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(Color.fromARGB(255, 226, 226, 226)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
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
          fn();
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
