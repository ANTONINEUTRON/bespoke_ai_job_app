import 'dart:io';

import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_analysis_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return GestureDetector(
      onTap: () {
        selectFile();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(16.sp),
        child: Container(
          height: screenSize.height * 0.75,
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
    );
  }

  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "webp", "pdf"],
      type: FileType.custom,
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      //Save File
      context.read<ResumeBloc>().saveSelectedResume(file: file).then(
        (value) {
          Navigator.push(
            context,
            ResumeAnalysisPage.route(),
          );
        },
      );
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("No file selected"),
      ));
    }
  }
}
