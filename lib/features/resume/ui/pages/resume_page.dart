import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/utility_functions.dart';
import '../../bloc/resume_bloc.dart';
import '../../data/model/resume_model.dart';
import '../widgets/select_resume_widget.dart';
import '../widgets/uploaded_resume_item.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ResumeModel> listOfResume = context.watch<ResumeBloc>().state.resumes;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Resume Upload",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wall2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Text(
                    "Hello! You can access and manage your resume here...",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                Expanded(
                  child: Center(
                    child: listOfResume.isNotEmpty
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...listOfResume.map(
                              (resume) => UploadedResumeItem(
                            resume: resume,
                          ).addSpacing(bottom: 4.h),
                        ),
                      ],
                    )
                        : const SelectResumeWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: listOfResume.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () {
             UtilityFunctions.selectFile(context);
            },
           label: const Text("Add Resume"),
            icon: const Icon(Icons.add),
      ),
    );
  }
}














