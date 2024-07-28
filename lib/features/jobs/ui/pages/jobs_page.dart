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

    var floatingActionButton = FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          AddJobPage.route(),
        );
      },
      label: const Text("New Job"),
      icon: const Icon(Icons.add),
    );
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: jobs.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Find out,\nHow well you fit the Job",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                        ).addSpacing(bottom: 18.h),
                        GestureDetector(
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: JobSearchDelegate(jobs),
                            );
                          },
                          child: CircleAvatar(
                            child: const Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                    ...jobs.map(
                      (job) => JobItem(
                        job: job,
                      ),
                    ),
                  ],
                )
              //
              //
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Your job comparison starts here! Add a job posting from Upwork, Indeed, or another platform",
                        style: TextStyle(fontSize: 18.sp),
                        textAlign: TextAlign.center,
                      ).addSpacing(bottom: 16.h),
                      floatingActionButton,
                    ],
                  ),
                ),
        ),
      ),
      floatingActionButton: jobs.isEmpty ? null : floatingActionButton,
    );
  }
}
