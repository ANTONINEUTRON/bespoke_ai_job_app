import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeAIInsightsWidget extends StatelessWidget {
  const ResumeAIInsightsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var selectedResume = context.read<ResumeBloc>().state.selectedResume;

    return Container(
      child: Text("Insights"),
    );
  }
}
