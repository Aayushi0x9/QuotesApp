import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget heading({required String heading}) {
  return Text(
    textAlign: TextAlign.start,
    heading,
    style: GoogleFonts.roboto(
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 2,
// fontFamily: _fontFamily[3],
      ),
    ),
  );
}
