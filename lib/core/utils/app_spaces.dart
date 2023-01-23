import 'package:flutter/cupertino.dart';

class AppSpaces {
  static double defaultSpace = 16;

  AppSpaces._();

  static Padding spacesBottom1 = Padding(padding: EdgeInsets.only(bottom: 5));

  static Padding spacesHeight3 = Padding(padding: EdgeInsets.only(top: 3));
  static Padding spacesHeight5 = Padding(padding: EdgeInsets.only(top: 5));
  static Padding spacesHeight10 = Padding(padding: EdgeInsets.only(top: 10));
  static Padding spacesHeight15 = Padding(padding: EdgeInsets.only(top: 15));
  static Padding spacesHeight20 = Padding(padding: EdgeInsets.only(top: 20));
  static Padding spacesHeight25 = Padding(padding: EdgeInsets.only(top: 25));
  static Padding spacesHeight30 = Padding(padding: EdgeInsets.only(top: 30));
  static Padding spacesHeight35 = Padding(padding: EdgeInsets.only(top: 35));
  static Padding spacesHeight40 = Padding(padding: EdgeInsets.only(top: 40));

  static Padding spacesWidth5 = Padding(padding: EdgeInsets.only(left: 5));
  static Padding spacesWidth10 = Padding(padding: EdgeInsets.only(left: 10));
  static Padding spacesWidth15 = Padding(padding: EdgeInsets.only(left: 15));
  static Padding spacesWidth20 = Padding(padding: EdgeInsets.only(left: 20));

  static EdgeInsets spacesAll5 = EdgeInsets.all(5);
  static EdgeInsets spacesAll10 = EdgeInsets.all(10);
  static EdgeInsets spacesAll15 = EdgeInsets.all(15);
  static EdgeInsets spacesAll20 = EdgeInsets.all(20);

  static Padding spacesWidth25 = Padding(padding: EdgeInsets.only(left: 25));

  static EdgeInsets customSpaces(
          {double? left, double? right, double? bottom, double? top}) =>
      EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0);

  static EdgeInsets customAllSpaces(double space) => EdgeInsets.all(space);
}
