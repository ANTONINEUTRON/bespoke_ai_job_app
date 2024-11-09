// import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
// import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
// import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
// import 'package:bespoke_ai_job_app/features/resume/ui/widgets/select_resume_widget.dart';
// import 'package:bespoke_ai_job_app/features/resume/ui/widgets/uploaded_resume_item.dart';
// import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class ResumePage extends StatelessWidget {
//   const ResumePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<ResumeModel> listOfResume = context.watch<ResumeBloc>().state.resumes;
//
//     return Scaffold(
//       body: SafeArea(
//         child: ListView(
//           padding: EdgeInsets.all(16.sp),
//           children: [
//             if (listOfResume.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Hello! \nAccess & manage your resume here",
//                     style: TextStyle(
//                       fontSize: 18.sp,
//                     ),
//                   ).addSpacing(
//                     bottom: 18.h,
//                   ),
//                   ...listOfResume.map(
//                     (resume) => UploadedResumeItem(
//                       resume: resume,
//                     ).addSpacing(bottom: 4.h),
//                   ),
//                 ],
//               ),
//             if (listOfResume.isEmpty) const SelectResumeWidget(),
//           ],
//         ),
//       ),
//       floatingActionButton: listOfResume.isEmpty
//           ? null
//           : FloatingActionButton.extended(
//               onPressed: () {
//                 UtilityFunctions.selectFile(context);
//               },
//               label: const Text("Add Resume"),
//               icon: const Icon(Icons.add),
//             ),
//     );
//   }
// }




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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/wall2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello! \nAccess & manage your resume here",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ).addSpacing(bottom: 24.h),

              // Centered card or list of uploaded resumes
              if (listOfResume.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...listOfResume.map(
                            (resume) => UploadedResumeItem(
                          resume: resume,
                        ).addSpacing(bottom: 4.h),
                      ),
                    ],
                  ),
                )
              else
                const SelectResumeWidget(),
            ],
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






