import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/job_item.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/not_found_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobSearchDelegate extends SearchDelegate {
  JobSearchDelegate(this.jobs);

  final List<Job> jobs;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Icon Button  to Exit from the search screen.
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Job> result = jobs
        .where(
          (element) =>
              element.description.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return result.isEmpty
        ? NotFoundUI(
            message: "No Job Found!",
          )
        : ListView.builder(
            itemCount: result.length,
            padding: EdgeInsets.all(16.sp),
            itemBuilder: (context, index) {
              var job = result[index];
              return JobItem(job: job);
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
