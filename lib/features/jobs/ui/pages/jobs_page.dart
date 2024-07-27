import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Jobs"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          const Text("Discover Your Fit In order to find your next job"),
          ...jobs.map(
            (job) => JobItem(job: job,),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            AddJobPage.route(),
          );
        },
        label: const Text("New Job"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
