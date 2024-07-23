import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension WidgetHelpers on Widget {
  Widget addSpacing({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    assert(
      (left == null && right == null && top == null && bottom == null) ||
          (horizontal == null && vertical == null),
      'If left, right, top, or bottom are provided, horizontal and vertical must be null, and vice versa',
    );
    assert(
      (horizontal == null && vertical == null) ||
          (left == null && right == null && top == null && bottom == null),
      'If horizontal or vertical are provided, left, right, top, and bottom must be null, and vice versa',
    );

    EdgeInsets padding;
    if (left != null || right != null || top != null || bottom != null) {
      padding = EdgeInsets.only(
        left: (left ?? 0.0).w,
        right: (right ?? 0.0).w,
        top: (top ?? 0.0).h,
        bottom: (bottom ?? 0.0).h,
      );
    } else {
      padding = EdgeInsets.symmetric(
        horizontal: (horizontal ?? 0.0).w,
        vertical: (vertical ?? 0.0).w,
      );
    }

    return Padding(
      padding: padding,
      child: this,
    );
  }
}
