import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_state.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/interview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PotentialInterviewQuestionsView extends StatefulWidget {
  const PotentialInterviewQuestionsView({
    super.key,
  });

  @override
  State<PotentialInterviewQuestionsView> createState() =>
      _PotentialInterviewQuestionsViewState();
}

class _PotentialInterviewQuestionsViewState
    extends State<PotentialInterviewQuestionsView> {
  @override
  void initState() {
    super.initState();
    context.read<JobsBloc>().generateInterviewQuestions();
  }

  @override
  Widget build(BuildContext context) {
    InterviewQuestionsStatus status =
        context.watch<JobsBloc>().state.interviewQuestionsStatus;

    Widget viewToShow = Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    switch (status) {
      case InterviewQuestionsStatus.success:
        viewToShow = const InterviewSection();
        break;
      case InterviewQuestionsStatus.error:
        viewToShow = const Center(
          child: Text("An error occured"),
        );
        break;
      default:
        break;
    }

    return Container(
      child: ListView(
        padding: EdgeInsets.all(16.sp),
        children: [
          Text(
            "Potential Interview Questions",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          viewToShow,
        ],
      ),
    );
  }
}
