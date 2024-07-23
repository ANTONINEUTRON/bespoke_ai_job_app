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
    return GestureDetector(
      onTap: () {
        context.read<ResumeBloc>().setSelectedResume(resume: resume).then(
          (value) {
            Navigator.push(context, ResumeAnalysisPage.route());
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(16.sp),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8.sp,
            vertical: 8.sp,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  resume.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              CloseButton(
                onPressed: () {
                  context.read<ResumeBloc>().removeResume(resume: resume);
                },
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
