// import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
// import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
// import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
// import 'package:bespoke_ai_job_app/features/jobs/ui/dialogs/select_resume_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:uuid/uuid.dart';
//
// class AddJobPage extends StatefulWidget {
//   const AddJobPage({
//     super.key,
//     this.job,
//   });
//
//   static route({Job? job}) => MaterialPageRoute(
//         builder: (context) => AddJobPage(
//           job: job,
//         ),
//       );
//
//   final Job? job;
//
//   @override
//   State<AddJobPage> createState() => _AddJobPageState();
// }
//
// class _AddJobPageState extends State<AddJobPage> {
//   String? jobPosting;
//
//   late bool isEditMode;
//
//   final TextEditingController _textEditingController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     isEditMode = widgets.job != null;
//
//     if (isEditMode) {
//       _textEditingController.text = widgets.job?.description ?? "";
//       jobPosting = _textEditingController.text;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var bloc = context.watch<JobsBloc>();
//     String? errorMsg = bloc.state.errorMsg;
//
//     if (errorMsg != null) {
//       _showErrorMsg(
//         context: context,
//         errorMsg: errorMsg,
//       );
//     }
//
//     return PopScope(
//       onPopInvoked: (didPop) {
//         bloc.reset();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(isEditMode ? "Update Job" : "Add Job"),
//           centerTitle: true,
//           leading: const CloseButton(),
//         ),
//         body: Column(
//           children: [
//             const Text(
//               "Paste your job posting below and get AI insight based on your selected resume",
//             ),
//             Expanded(
//               child: TextField(
//                 controller: _textEditingController,
//                 onChanged: (value) => jobPosting = value,
//                 decoration: const InputDecoration(
//                   hintText: "Paste the job description here..",
//                   border: OutlineInputBorder(),
//                 ),
//                 maxLines: 22,
//               ).addSpacing(top: 8.h),
//             ),
//           ],
//         ).addSpacing(horizontal: 16.w),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             _showSelectResumeDialog(context);
//           },
//           label: const Text("Analyze this Job"),
//           icon: const Icon(Icons.smart_button_sharp),
//         ),
//       ),
//     );
//   }
//
//   void _showSelectResumeDialog(BuildContext context) {
//     // validate the input
//     if (jobPosting == null || (jobPosting?.length ?? 0) < 10) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please enter a valid job posting"),
//         ),
//       );
//       return;
//     }
//
//     saveJobDetails();
//
//     // show modal sheet for user to select resume
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => const SelectResumeView(),
//     );
//   }
//
//   void saveJobDetails() {
//     // Checks if we are editing a job or updating it
//     // in order to reuse object or create new object
//     Job job = isEditMode
//         ? widgets.job!.copyWith(
//             description: jobPosting!,
//             date: DateTime.now(),
//           )
//         : Job(
//             id: const Uuid().v1(),
//             description: jobPosting!,
//           );
//
//     //set job details
//     context.read<JobsBloc>().setJob(job);
//   }
//
//   void _showErrorMsg({
//     required BuildContext context,
//     required String errorMsg,
//   }) {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (timeStamp) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(errorMsg),
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/dialogs/select_resume_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key, this.job});

  static route({Job? job}) => MaterialPageRoute(
    builder: (context) => AddJobPage(job: job),
  );

  final Job? job;

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  String? jobPosting;
  late bool isEditMode;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditMode = widget.job != null;
    if (isEditMode) {
      _textEditingController.text = widget.job?.description ?? "";
      jobPosting = _textEditingController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<JobsBloc>();
    String? errorMsg = bloc.state.errorMsg;

    if (errorMsg != null) {
      _showErrorMsg(context: context, errorMsg: errorMsg);
    }

    return PopScope(
      onPopInvoked: (didPop) {
        bloc.reset();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/wall2.jpg',
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Text(
                            isEditMode ? "Update Job" : "Add Job Description",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade700,
                            ),
                          ).addSpacing(bottom: 16.h),
                          Text(
                            "Paste your job description below and get AI insights based on your selected resume.",
                            style: TextStyle(fontSize: 14.sp, color: Colors.black87,fontWeight: FontWeight.w400),
                          ).addSpacing(bottom: 24.h),
                          Container(
                            height: 550.h,
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.sp),
                              border: Border.all(color: Colors.teal.shade200),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(2, 4),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _textEditingController,
                              onChanged: (value) => jobPosting = value,
                              decoration: InputDecoration(
                                hintText: "Paste the job description here...",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey[400]),
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(fontSize: 16.sp, color: Colors.black87),
                            ),
                          ),
                          SizedBox(height: 16.h), // Reduced spacing for Analyze button
                          Align(
                            alignment: Alignment.center,
                            child: OutlinedButton.icon(
                              onPressed: () => _showSelectResumeDialog(context),
                              icon: Icon(
                                Icons.smart_button,
                                color: Colors.teal.shade600,
                              ),
                              label: Text(
                                "Analyze this Job",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.teal.shade600,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.h,
                                ),
                                side: BorderSide(color: Colors.teal.shade600, width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSelectResumeDialog(BuildContext context) {
    if (jobPosting == null || (jobPosting?.length ?? 0) < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid job posting",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),),
        ),
      );
      return;
    }
    saveJobDetails();
    showModalBottomSheet(
      context: context,
      builder: (context) => const SelectResumeView(),
    );
  }

  void saveJobDetails() {
    Job job = isEditMode
        ? widget.job!.copyWith(
      description: jobPosting!,
      date: DateTime.now(),
    )
        : Job(
      id: const Uuid().v1(),
      description: jobPosting!,
    );
    context.read<JobsBloc>().setJob(job);
  }

  void _showErrorMsg({required BuildContext context, required String errorMsg}) {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      },
    );
  }
}



