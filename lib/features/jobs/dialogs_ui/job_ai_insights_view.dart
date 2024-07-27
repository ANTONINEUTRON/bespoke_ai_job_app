import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobAiInsightsView extends StatelessWidget {
  const JobAiInsightsView({super.key});

  @override
  Widget build(BuildContext context) {
    String? aiInsight = context.watch<JobsBloc>().state.aiInsight;

    return aiInsight == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
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
            body: Stack(
              children: [
                Positioned(
                  top: 4.h,
                  right: 0,
                  left: 0,
                  bottom: 50.h,
                  child: Column(
                    // padding: EdgeInsets.symmetric(horizontal: 16.sp),
                    children: [
                      Expanded(child: Markdown(data: aiInsight)),
                    ],
                  ),
                ),
                Positioned(
                    right: 8,
                    left: 8,
                    bottom: 0,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Generate another response"),
                    ))
              ],
            ),
          );
  }
}
