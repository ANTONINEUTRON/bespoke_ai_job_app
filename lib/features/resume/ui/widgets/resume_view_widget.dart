import 'dart:io';

import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ResumeViewWidget extends StatelessWidget {
  const ResumeViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var selectedResume = context.read<ResumeBloc>().state.selectedResume;

    var filePath = selectedResume!.filePath;
    return filePath.contains("pdf")
  
        ? PDFView(
            filePath: filePath,
          )
        : InteractiveViewer(
            child: Image.file(
              File(filePath),
            ),
          );
  }
}
