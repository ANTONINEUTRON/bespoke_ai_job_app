import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/widgets/potential_interview_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobAiInsightsView extends StatefulWidget {
  const JobAiInsightsView({super.key});

  @override
  State<JobAiInsightsView> createState() => _JobAiInsightsViewState();

  static route() => MaterialPageRoute(
        builder: (context) => const JobAiInsightsView(),
      );
}

class _JobAiInsightsViewState extends State<JobAiInsightsView> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<JobsBloc>();
    var state = bloc.state;
    String? aiInsight = state.aiInsight;

    if (state.errorMsg != null) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        title: Text(
          "Job Analysis Result",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
      ),
      body: aiInsight == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.82,
                  child: Markdown(
                    selectable: true,
                    data: aiInsight,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    bloc.generateInterviewQuestions();

                    showModalBottomSheet(
                      context: context,
                      enableDrag: true,
                      showDragHandle: true,
                      builder: (context) =>
                          const PotentialInterviewQuestionsView(),
                    );
                  },
                  child: const Text("Potential Interview Questions"),
                ),
              ],
            ),
    );
  }
}
