import 'package:agentapp/utils/styles.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'utils.dart';

appCounterDecoration(color) => BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );
var appSeparationLineDecoration = BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey,
);

var appSeparationDarkLineDecoration = BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey,
);

BoxDecoration linearGradientBoxDecoration(
        {List<Color> colors = const [
          skyBlueColor,
          purpleColor,
        ],
        List<double>? stops = const [0.0, 0.3]}) =>
    BoxDecoration(
      gradient: LinearGradient(
        stops: stops,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: colors,
      ),
    );

circularCustomColorBoxDecorationWithRadiusElevation(
        Color color, double elevation) =>
    BoxDecoration(
      shape: BoxShape.circle,
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: elevation,
        ),
      ],
    );

rectangularWhiteBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white);

rectangularAppBarBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: accentColor);

rectangularLighterGreyBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: lighterGreyColor);

rectangularWhiteBoxDecorationWithRadiusBlackBorder(double radius,
        {opacity = 0.1}) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: Colors.black.withOpacity(opacity)),
        color: Colors.white);

rectangularWhiteBoxDecorationWithRadiusSelectedBorder(double radius) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: accentColor, width: 3),
        color: Colors.white);

rectangularWhiteBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularCounterFieldBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: counterFieldColor);

rectangularTextFieldBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: counterFieldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularDeleteFieldBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: deleteFieldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularSkyBlueBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: skyBlueColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularYellowBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius)),
        color: accentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularYellowBoxDecorationTopWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        color: accentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularAppBarBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: accentColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: lighterGreyColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBoxDecorationWithRadius(double radius) => BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(radius),
      color: lighterGreyColor,
    );

rectangularDisabledBoxDecorationWithRadius(double radius) => BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(radius),
      color: disabledGreyColor,
    );

densedFieldDecorationWithoutPadding(
        {hint,
        verticalPad = 0.0,
        horizontalPad = 0.0,
        requireDensed = false,
        counterText}) =>
    InputDecoration(
      isDense: requireDensed,
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
          vertical: verticalPad, horizontal: horizontalPad),
      border: (requireDensed) ? InputBorder.none : null,
      hintText: hint,
      hintStyle: regularWhiteText14(Colors.black.withOpacity(0.5)),
      counter: isNotEmpty(counterText)
          ? Text(
              counterText,
              style: regularWhiteText8(Colors.black),
            )
          : null,
    );

rectangularCustomColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
  Color color,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);

rectangularBoxDecorationWithCustomRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)));

rectangularCustomColorBoxDecorationWithRadiusBorder(double topLeft,
        double bottomLeft, double bottomRight, double topRight, Color color,
        {borderWidth = 1.0}) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: accentColor, width: borderWidth),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
          topRight: Radius.circular(topRight),
        ),
        color: color);

rectangularCustomColorBoxDecorationWithRadiusBorderOnly(double topLeft,
        double bottomLeft, double bottomRight, double topRight, Color color,
        {borderWidth = 1.0}) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
          topRight: Radius.circular(topRight),
        ),
        color: color);

optionsBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: Colors.black,
      width: 0.6,
    ));

selectedOptionsBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: accentColor, width: 2.0),
    );

ellipticalCustomColorBoxDecorationWithRadius(double x, double y, Color color,
        {top = false}) =>
    (!top)
        ? BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(
                x,
                y,
              ),
            ),
            color: color)
        : BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(
                x,
                y,
              ),
            ),
            color: color);

rectangularTransparentBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularCustomColorBoxAndBorderDecorationWithRadius(
        double radius, Color fillColor, Color strokeColor,
        {borderWidth = 0.5}) =>
    BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: strokeColor, width: borderWidth),
      color: fillColor,
    );

rectangularAppBarColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
  Color color,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);
