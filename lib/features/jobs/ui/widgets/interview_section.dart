import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/interview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class InterviewSection extends StatefulWidget {
  const InterviewSection({
    super.key,
  });

  @override
  State<InterviewSection> createState() => _InterviewSectionState();
}

class _InterviewSectionState extends State<InterviewSection> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    List<Interview> interviewQuestions =
        context.read<JobsBloc>().state.interviewQuestions ?? [];
        
    var interviewQuestion = interviewQuestions[_index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question ${_index + 1}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(interviewQuestion.question),
        ),
        ShowAnswerButton(
          answer: interviewQuestion.response,
        ),
        //
        //Controls
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_index == 0) {
                      _index = interviewQuestions.length - 1;
                    } else {
                      _index--;
                    }
                  });
                },
                child: Text("Previous"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_index >= interviewQuestions.length - 1) {
                      _index = 0;
                    } else {
                      _index++;
                    }
                  });
                },
                child: Text("Next"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ShowAnswerButton extends StatefulWidget {
  const ShowAnswerButton({
    super.key,
    required this.answer,
  });

  final String answer;

  @override
  State<ShowAnswerButton> createState() => _ShowAnswerButtonState();
}

class _ShowAnswerButtonState extends State<ShowAnswerButton> {
  bool toShow = false;
  @override
  Widget build(BuildContext context) {
    return toShow
        ? Markdown(
            data: widget.answer,
            selectable: true,
            onTapText: () => setState(() {
              toShow = false;
            }),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        : ElevatedButton(
            onPressed: () {
              setState(() {
                toShow = true;
              });
            },
            child: const Text("Show Answer"),
          );
  }
}
