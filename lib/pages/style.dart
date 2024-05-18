import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//not sure how to make a static library yet

class Style {
  final subheader = GoogleFonts.lato().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0),
    );
}