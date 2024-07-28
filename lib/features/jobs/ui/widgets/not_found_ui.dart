import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotFoundUI extends StatelessWidget {
  const NotFoundUI({
    super.key,
    required this.message,
    this.image,
  });

  final String message;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 100.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            // image != null ? image! : Assets.anims.noFound.image(),
            // SizedBox(
            //   height: 8.h,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            //           Image.asset(
            //   "assets/anims/lyrics_not_found.gif",
            //   height: 125.0,
            //   width: 125.0,
            // ),
          ],
        ),
      ),
    );
  }
}
