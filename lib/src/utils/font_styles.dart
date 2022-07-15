import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final TextTheme textTheme = GoogleFonts.nunitoTextTheme();

  static final title = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final normal = GoogleFonts.nunito(
    fontWeight: FontWeight.w300,
  );

  static final regular = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
  );
}
