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
