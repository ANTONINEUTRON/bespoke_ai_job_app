
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectResumeWidget extends StatefulWidget {
  const SelectResumeWidget({
    super.key,
  });

  @override
  State<SelectResumeWidget> createState() => _SelectResumeWidgetState();
}

class _SelectResumeWidgetState extends State<SelectResumeWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTapCancel: () => setState(() => _isPressed = false),
        onTap: () {
          UtilityFunctions.selectFile(context);
        },
        child: AnimatedScale(
          scale: _isPressed ? 0.98 : 1.0,
          duration: const Duration(milliseconds: 100),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Container(
              height: screenSize.height * 0.2,
              width: screenSize.width * 0.9,
              padding: EdgeInsets.all(16.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.sp),
                gradient: LinearGradient(
                  colors: [Colors.teal.shade50, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 48.sp,
                    color: Colors.teal.shade500,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Add Resume",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Supported Format: PDF, JPG, PNG",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

















