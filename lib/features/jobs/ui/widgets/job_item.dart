import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/pages/add_job_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class JobItem extends StatelessWidget {
  const JobItem({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: ListTile(
        title: Text(
          job.description,
          maxLines: 2,
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(
            job.date ?? DateTime.now(),
          ),
        ),
        trailing: CloseButton(
          onPressed: () {
            context.read<JobsBloc>().deleteJob(job);
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            AddJobPage.route(
              job: job,
            ),
          );
        },
      ),
    );
  }
}
