import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/dialogs/job_ai_insights_view.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeSelectItem extends StatelessWidget {
  const ResumeSelectItem({
    super.key,
    required this.resumeModel,
  });

  final ResumeModel resumeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Close this modal sheet
        Navigator.pop(context);

        // call function to pass resume and job to AI
        context.read<JobsBloc>().generateAiInsight(resume: resumeModel);

        // Show the modal for holding AI response
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return const JobAiInsightsView();
          },
        );
      },
      child: Card.outlined(
        child: ListTile(
          title: Text(resumeModel.title),
          trailing: const Icon(Icons.arrow_forward_ios_outlined),
        ),
      ),
    );
  }
}
