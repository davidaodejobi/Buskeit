import 'package:flutter/material.dart';

extension AppPadding on Widget {
  Widget get paddingRight => Padding(
        padding: const EdgeInsets.only(
          right: 10,
        ),
        child: this,
      );

  Widget get paddingLeft => Padding(
        padding: const EdgeInsets.only(
          left: 10,
        ),
        child: this,
      );

  paddingBottom({double padding = 10.0}) => Padding(
        padding: EdgeInsets.only(
          bottom: padding,
        ),
        child: this,
      );

  paddingHorizontal({double padding = 10.0}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: this,
      );

  paddingVertical({double padding = 10.0}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: padding,
        ),
        child: this,
      );

  paddingAll({double padding = 16}) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  paddingSymmetric({double vertical = 16, double horizontal = 16}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );

  paddingLTRB(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );
}
