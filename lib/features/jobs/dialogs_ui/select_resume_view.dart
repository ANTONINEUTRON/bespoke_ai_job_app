import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/resume_select_item.dart';
import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectResumeView extends StatelessWidget {
  const SelectResumeView({super.key});

  @override
  Widget build(BuildContext context) {
    var listfResume = context.watch<ResumeBloc>().state.resumes;

    return Container(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Select the resume you want to apply with"),
          // const CloseButton(),
          ...listfResume.map(
            (resume) => ResumeSelectItem(
              resumeModel: resume,
            ),
          ),

          ElevatedButton(
            onPressed: () {
              UtilityFunctions.selectFile(context);
            },
            child: Text("Add Resume"),
          ),
        ],
      ),
    );
  }
}
