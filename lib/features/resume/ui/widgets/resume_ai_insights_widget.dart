import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ResumeAIInsightsWidget extends StatefulWidget {
  const ResumeAIInsightsWidget({
    super.key,
  });

  @override
  State<ResumeAIInsightsWidget> createState() => _ResumeAIInsightsWidgetState();
}

class _ResumeAIInsightsWidgetState extends State<ResumeAIInsightsWidget> {
  @override
  void initState() {
    super.initState();
    var bloc = context.read<ResumeBloc>();
    if (bloc.state.aiInsight == null) bloc.fetchAiInsights();
  }

  @override
  Widget build(BuildContext context) {
    var blocState = context.watch<ResumeBloc>().state;
    String? aiInsight = blocState.aiInsight;

    return aiInsight == null
        ? const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text("Loading AI Insight"),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: Markdown(
                  data: aiInsight,
                  selectable: true,
                ),
              ),
            ],
          );
  }
}
