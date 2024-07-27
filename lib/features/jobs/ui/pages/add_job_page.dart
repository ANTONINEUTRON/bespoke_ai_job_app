import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/dialogs_ui/select_resume_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({super.key, this.job});

  static route({Job? job}) => MaterialPageRoute(
        builder: (context) => AddJobPage(
          job: job,
        ),
      );

  final Job? job;

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  String? jobPosting;

  late bool isEditMode;

  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditMode = widget.job != null;

    if (isEditMode) {
      _textEditingController.text = widget.job?.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? "Update Job" : "Add Job"),
        centerTitle: true,
        leading: const CloseButton(),
      ),
      body: Column(
        children: [
          const Text(
            "Paste your job posting below and get cover letter and insight based on your selected resume",
          ),
          Expanded(
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) => jobPosting = value,
              decoration: const InputDecoration(
                hintText: "Paste the job description here..",
                border: OutlineInputBorder(),
              ),
              maxLines: 22,
            ).addSpacing(top: 8.h),
          ),
        ],
      ).addSpacing(horizontal: 16.w),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showSelectResumeDialog(context);
        },
        label: const Text("Analyze this Job"),
        icon: const Icon(Icons.smart_button_sharp),
      ),
    );
  }

  void _showSelectResumeDialog(BuildContext context) {
    // validate the input
    if (jobPosting == null || (jobPosting?.length ?? 0) < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid job posting"),
        ),
      );
      return;
    }

    // Checks if we are editing a job or updating it
    // in order to reuse object or create new object
    Job job = isEditMode
        ? widget.job!.copyWith(
            description: jobPosting!,
            date: DateTime.now(),
          )
        : Job(
            id: const Uuid().v1(),
            description: jobPosting!,
          );

    //set job details
    context.read<JobsBloc>().setJob(job);

    // show modal sheet for user to select resume
    showModalBottomSheet(
      context: context,
      builder: (context) => const SelectResumeView(),
    );
  }
}
