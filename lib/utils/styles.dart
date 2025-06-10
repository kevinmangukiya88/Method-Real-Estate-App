import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Regular Text Styles
regularWhiteText8(color) => TextStyle(
      fontSize: 8,
      color: color,
      fontWeight: FontWeight.normal,
    );

regularWhiteText10(color, {FontWeight fontWeight = FontWeight.normal}) =>
    TextStyle(
      fontSize: 10,
      color: color,
      fontWeight: fontWeight,
    );

regularWhiteText12(color,
        {overflow,
        decoration,
        fontStyle,
        FontWeight fontWeight = FontWeight.normal}) =>
    TextStyle(
        fontSize: 12,
        fontFamily: 'Avenir',
        color: color,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        overflow: overflow,
        decoration: decoration);

regularWhiteText14(
  color, {
  decoration,
  fontStyle = FontStyle.normal,
  fontWeight = FontWeight.normal,
  lineSpacing,
  shadows,
  decorationColor,
}) =>
    TextStyle(
        fontSize: 14,
        color: color,
        shadows: shadows,
        decorationColor: decorationColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: lineSpacing,
        decoration: decoration);

regularWhiteTextWithDecoration14(color) => TextStyle(
      decoration: TextDecoration.underline,
      fontSize: 14,
      color: color,
      fontWeight: FontWeight.normal,
    );

regularWhiteText16(color, {decoration}) => TextStyle(
    fontSize: 16,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);
regularWhiteText13(color, {decoration}) => TextStyle(
    fontSize: 13,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

regularWhiteText18(color, {decoration, FontWeight = FontWeight.normal}) =>
    TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight,
        decoration: decoration);
regularWhiteText15({
  decoration,
  color,
  weight,
}) =>
    TextStyle(
        fontSize: 15,
        color: color,
        // fontFamily: 'Avenir',
        fontStyle: FontStyle.normal,
        fontWeight: weight,
        decoration: decoration);

regularWhiteText20(color,
        {decoration, FontWeight fontWeight = FontWeight.normal}) =>
    TextStyle(
        fontSize: 20,
        color: color,
        fontWeight: FontWeight.normal,
        decoration: decoration);

regularWhiteText22(color, {decoration}) => TextStyle(
    fontSize: 22,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);

regularWhiteText24(color, {decoration}) => TextStyle(
    fontSize: 24,
    color: color,
    fontWeight: FontWeight.normal,
    decoration: decoration);
regularWhiteText21(color, {decoration}) => TextStyle(
    fontSize: 21,
    fontFamily: 'Avenir',
    color: color,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    decoration: decoration);

boldText21(color, {decoration}) => TextStyle(
    fontSize: 21,
    fontFamily: 'Avenir',
    color: color,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    decoration: decoration);

regularWhiteText40(color,
        {decoration, FontWeight fontWeight = FontWeight.normal}) =>
    TextStyle(
        fontSize: 40,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration);
regularWhiteText19(
  color, {
  decoration,
}) =>
    TextStyle(
        fontSize: 19,
        color: color,
        fontWeight: FontWeight.w500,
        decoration: decoration);

//Bold Text Styles
boldWhiteText8(color) => TextStyle(
      fontSize: 8,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText10(color) => TextStyle(
      fontSize: 10,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText12(color, {fontStyle}) => TextStyle(
      fontSize: 12,
      color: color,
      fontStyle: fontStyle,
      fontWeight: FontWeight.bold,
    );

boldWhiteText14(color,
        {decoration, fontStyle = FontStyle.normal, lineSpacing}) =>
    TextStyle(
        fontSize: 14,
        color: color,
        fontStyle: fontStyle,
        fontWeight: FontWeight.bold,
        height: lineSpacing,
        decoration: decoration);

boldWhiteText16(color) => TextStyle(
      fontSize: 16,
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText18(color, {height}) => TextStyle(
      fontSize: 18,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );

boldWhiteText32(color, {lineSpacing}) => TextStyle(
    fontSize: 32,
    // default is 0.0
    color: color,
    fontWeight: FontWeight.bold,
    height: lineSpacing);

boldWhiteText40(color, {lineSpacing}) => TextStyle(
    fontSize: 32,
    // default is 0.0
    color: color,
    fontWeight: FontWeight.bold,
    height: lineSpacing);

boldWhiteText42(color, {lineSpacing}) => TextStyle(
    fontSize: 42,
    // default is 0.0
    color: color,
    fontWeight: FontWeight.bold,
    height: lineSpacing);

boldWhiteText28(color) => TextStyle(
      fontSize: 28, // default is 0.0
      color: color,
      fontWeight: FontWeight.bold,
    );
boldWhiteText30(color) => TextStyle(
      fontSize: 30, // default is 0.0
      color: color,
      fontWeight: FontWeight.bold,
    );

boldWhiteText24(color, {height, double fontSize = 24}) => TextStyle(
      fontSize: fontSize,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );

boldWhiteText20(color, {height}) => TextStyle(
      fontSize: 20,
      color: color,
      height: height,
      fontWeight: FontWeight.bold,
    );
