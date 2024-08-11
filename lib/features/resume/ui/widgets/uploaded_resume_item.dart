import 'dart:io';

import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_analysis_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadedResumeItem extends StatelessWidget {
  const UploadedResumeItem({
    super.key,
    required this.resume,
  });

  final ResumeModel resume;

  @override
  Widget build(BuildContext context) {
    ResumeBloc resumeBloc = context.watch<ResumeBloc>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  resumeBloc.setSelectedResume(resume: resume).then(
                    (value) {
                      Navigator.push(context, ResumeAnalysisPage.route());
                    },
                  );
                },
                child: resume.screenshots == null
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(),//Column(mainAxisSize: MainAxisSize.max,crossAxisAlignment: CrossAxisAlignment.stretch,children: [Text("gg")],),
                      )
                    : Image.file(
                        opacity: const AlwaysStoppedAnimation(0.17),
                        File(resume.screenshots!.first),
                      ),
              ),
            ),
            Positioned(
              bottom: 8.h,
              left: 8.w,
              child: Text(
                resume.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CloseButton(
                onPressed: () {
                  resumeBloc.removeResume(resume: resume);
                },
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
