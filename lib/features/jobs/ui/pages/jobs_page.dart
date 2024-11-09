// import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
// import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
// import 'package:bespoke_ai_job_app/features/jobs/delegates/search_delegate.dart';
// import 'package:bespoke_ai_job_app/features/jobs/ui/pages/add_job_page.dart';
// import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/job_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class JobsPage extends StatelessWidget {
//   const JobsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var jobs = context.watch<JobsBloc>().state.jobs;
//
//     var floatingActionButton = FloatingActionButton.extended(
//       onPressed: () {
//         Navigator.push(
//           context,
//           AddJobPage.route(),
//         );
//       },
//       label: const Text("New Job"),
//       icon: const Icon(Icons.add),
//     );
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.sp),
//           child: jobs.isNotEmpty
//               ? Column(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Find out,\nHow well you fit the Job",
//                           style: TextStyle(
//                             fontSize: 18.sp,
//                           ),
//                         ).addSpacing(bottom: 18.h),
//                         GestureDetector(
//                           onTap: () {
//                             showSearch(
//                               context: context,
//                               delegate: JobSearchDelegate(jobs),
//                             );
//                           },
//                           child: CircleAvatar(
//                             child: const Icon(Icons.search),
//                           ),
//                         ),
//                       ],
//                     ),
//                     ...jobs.map(
//                       (job) => JobItem(
//                         job: job,
//                       ),
//                     ),
//                   ],
//                 )
//               //
//               //
//               : SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.9,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Text(
//                         "Your job comparison starts here! Add a job posting from Upwork, Indeed, or another platform",
//                         style: TextStyle(fontSize: 18.sp),
//                         textAlign: TextAlign.center,
//                       ).addSpacing(bottom: 16.h),
//                       floatingActionButton,
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//       floatingActionButton: jobs.isEmpty ? null : floatingActionButton,
//     );
//   }
// }


import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/delegates/search_delegate.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/pages/add_job_page.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/job_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var jobs = context.watch<JobsBloc>().state.jobs;

    var outlineButton = OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          AddJobPage.route(),
        );
      },
      label: Text(
        "Add Job",
        style: TextStyle(color: Colors.teal.shade600),
      ),
      icon: Icon(Icons.add, color: Colors.teal.shade600),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.teal.shade600, width: 1.5),
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.h),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.h),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(16.sp),
              width: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 500.sp,
                maxHeight: MediaQuery.of(context).size.height * 0.75,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16.sp),
                border: Border.all(
                  color: Colors.teal.shade300,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: jobs.isNotEmpty
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Explore Jobs",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal.shade800,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: JobSearchDelegate(jobs),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.teal.shade400,
                          child: Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ],
                  ).addSpacing(bottom: 16.h),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        return JobItem(job: jobs[index])
                            .addSpacing(bottom: 12.h);
                      },
                    ),
                  ),
                ],
              )
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(
                    Icons.work_outline,
                    size: 50.sp,
                    color: Colors.teal.shade400,
                  ),
                    SizedBox(height: 20.h),
                    Text(
                    "No job postings yet!",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                    SizedBox(height: 12.h),
                    Text(
                    "Add a job posting to compare your fit.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ).addSpacing(bottom: 24.h),
                    outlineButton,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


