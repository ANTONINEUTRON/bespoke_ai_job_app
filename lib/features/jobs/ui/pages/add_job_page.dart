import 'package:bespoke_ai_job_app/extensions/widget_helpers.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/dialogs/select_resume_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({
    super.key,
    this.job,
  });

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

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditMode = widget.job != null;

    if (isEditMode) {
      _textEditingController.text = widget.job?.description ?? "";
      jobPosting = _textEditingController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<JobsBloc>();
    String? errorMsg = bloc.state.errorMsg;

    if (errorMsg != null) {
      _showErrorMsg(
        context: context,
        errorMsg: errorMsg,
      );
    }

    return PopScope(
      onPopInvoked: (didPop) {
        bloc.reset();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(isEditMode ? "Update Job" : "Add Job"),
          centerTitle: true,
          leading: const CloseButton(),
        ),
        body: Column(
          children: [
            const Text(
              "Paste your job posting below and get AI insight based on your selected resume",
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

    saveJobDetails();

    // show modal sheet for user to select resume
    showModalBottomSheet(
      context: context,
      builder: (context) => const SelectResumeView(),
    );
  }

  void saveJobDetails() {
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
  }

  void _showErrorMsg({
    required BuildContext context,
    required String errorMsg,
  }) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
          ),
        );
      },
    );
  }
}
