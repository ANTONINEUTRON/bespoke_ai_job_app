import 'dart:io';

import 'package:bespoke_ai_job_app/features/resume/bloc/resume_state.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/features/resume/data/repository/resume_repository.dart';
import 'package:bespoke_ai_job_app/shared/get_filename.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ResumeBloc extends Cubit<ResumeState> {
  ResumeBloc() : super(const ResumeState()) {
    fetchAllResumes();
  }

  final resumeRepo = ResumeRepository();

  Future<void> saveSelectedResume({required File file}) async {
    //save file to filesytem
    String path = await resumeRepo.saveFile(file: file);

    //store reference to hive
    var title = getFileName(path);
    var resumeModel = ResumeModel(
      id: const Uuid().v1(),
      // get title from filename minus the extension
      // detection the extension is based on searching for the -assumed- last dot in the filename
      title: title.substring(0, title.indexOf(".", title.length - 6)),
      filePath: path,
      date: DateTime.now(),
    );
    await resumeRepo.saveToHiveDB(
      resume: resumeModel,
    );

    fetchAllResumes();
    setSelectedResume(resume: resumeModel);
  }

  Future<void> fetchAllResumes() async {
    var resumes = await resumeRepo.getResumes();
    resumes.sort(
      (a, b) => b.date.compareTo(a.date),
    );
    emit(
      state.copyWith(
        resumes: resumes,
      ),
    );
  }

  Future<void> setSelectedResume({required ResumeModel resume}) async {
    emit(
      state.copyWith(selectedResume: resume),
    );
  }

  void removeResume({required ResumeModel resume}) async {
    await resumeRepo.deleteResume(resume);

    await fetchAllResumes();
  }
}
