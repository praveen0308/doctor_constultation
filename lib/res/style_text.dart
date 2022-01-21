import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  //#region ==Roboto Fonts==
  //#region Headline
  static final headline1 = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 80.0, fontWeight: FontWeight.w700));

  static final headline2 = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 60.0, fontWeight: FontWeight.w700));

  static final headline3 = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.w700));

  static final headline4 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 34.0, fontWeight: FontWeight.w500, letterSpacing: 0.0025));

  static final headline5 = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500));

  static final headline6 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.w500, letterSpacing: 0.0075));

  //#endregion

  //#region Subtitle
  static final subtitle1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          height: 2.4,
          letterSpacing: 0.05));

  static final subtitle2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 0.05));

  static final subtitle3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.05));

  //#endregion

  //#region Body
  static final body1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.05));

  static final body2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15));

  static final body3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.15));

  //#endregion

  //#region Button
  static final button1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.013));

  static final button2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ));
  static final button3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  ));

  //#endregion

  //#region Caption
  static final captionRF1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.03,
  ));

  static final captionRF2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.03,
  ));
  static final captionRF3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.03,
  ));
  static final captionRF4 = GoogleFonts.roboto(
      textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400));

  //#endregion

  //#region Overlie
  static final overlieRF1 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  ));

  static final overlieRF2 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.10,
  ));
  static final overlieRF3 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.10,
  ));
  static final overlieRF4 = GoogleFonts.roboto(
      textStyle: const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.05,
  ));
//#endregion

  //#region Review
  static final review = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 6,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.01,
      ));

  static final reviewPara = GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w400
      ));
  //#endregion
//#endregion

//#region ==Oxygen Font==
  //#region Caption
  static final captionOF1 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.03,
      ));

  static final captionOF2 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.03,
      ));
  static final captionOF3 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.03,
      ));
  static final captionOF4 = GoogleFonts.oxygen(
      textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400));

  //#endregion

  //#region Overlie
  static final overlieOF1 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ));

  static final overlieOF2 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.10,
      ));
  static final overlieOF3 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.10,
      ));
  static final overlieOF4 = GoogleFonts.oxygen(
      textStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.05,
      ));
//#endregion
//#endregion
}
