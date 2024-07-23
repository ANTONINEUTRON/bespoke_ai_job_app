import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/widgets/select_resume_widget.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/widgets/uploaded_resume_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ResumeModel> listOfResume = context.watch<ResumeBloc>().state.resumes;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Resume"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          const Text("Uploaded resume").addSpacing(bottom: 16.h),
          ...listOfResume.map(
            (resume) => UploadedResumeItem(
              resume: resume,
            ).addSpacing(bottom: 4.h),
          ),
          const Text("Upload resume").addSpacing(
            top: 24.h,
            bottom: 16.h,
          ),
          const SelectResumeWidget(),

//
          // const Text("Cover Letter (optional)"),
          // SizedBox(
          //   height: 16.h,
          // ),
          // TextField(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.all(
          //         Radius.circular(16.sp),
          //       ),
          //     ),
          //   ),
          //   minLines: 4,
          //   maxLines: 8,
          // ),
          // //
          // //
          // SizedBox(
          //   height: 16.h,
          // ),
          // ElevatedButton(
          //   onPressed: () {

          //   },
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Theme.of(context).primaryColor,
          //     foregroundColor: Colors.white,
          //     maximumSize: const Size.fromWidth(200),
          //   ),
          //   child: const Text("Submit"),
          // ),
        ],
      ),
    );
  }
}
