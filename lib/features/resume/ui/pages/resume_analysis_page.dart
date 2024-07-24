import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/widgets/resume_ai_insights_widget.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/widgets/resume_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResumeAnalysisPage extends StatefulWidget {
  const ResumeAnalysisPage({
    super.key,
  });

  static route() => MaterialPageRoute(
        builder: (context) => const ResumeAnalysisPage(),
      );

  @override
  State<ResumeAnalysisPage> createState() => _ResumeAnalysisPageState();
}

class _ResumeAnalysisPageState extends State<ResumeAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    var selectedResume = context.watch<ResumeBloc>().state.selectedResume;
    if (selectedResume == null) {
      Navigator.pop(context);
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectedResume!.title),
        ),
        body: const Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: "Resume",
                  icon: Icon(Icons.remove_red_eye_outlined),
                ),
                Tab(
                  text: "AI insights",
                  icon: Icon(Icons.insights),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ResumeViewWidget(),
                  ResumeAIInsightsWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
