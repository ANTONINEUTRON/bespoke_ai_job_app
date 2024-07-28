
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:dotted_border/dotted_border.dart';
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
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: () {
          UtilityFunctions.selectFile(context);
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: Radius.circular(16.sp),
          child: SizedBox(
            height: screenSize.height * 0.85,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  size: 32.sp,
                ),
                Text(
                  "Add Resume",
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                const Text("Supported Format PDF, JPG,PNGs"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
