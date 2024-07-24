import 'dart:io';

import 'package:bespoke_ai_job_app/shared/app_constants.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/shared/utility_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ResumeRepository {
  var resumeBox = Hive.box<ResumeModel>(RESUME_BOX_NAME);

  Future<String> saveFile({required File file}) async {
    
    return UtilityFunctions.saveFile(
      fileToSave: file,
      relativePath: "/resumes/${UtilityFunctions.getFileName(file.path)}",
    );
  }

  Future<void> saveToHiveDB({required ResumeModel resume}) async {
    resumeBox.put(
      resume.id,
      resume,
    );
  }

  Future<List<ResumeModel>> getResumes() async {
    return resumeBox.values.toList();
  }

  Future<void> deleteResume(ResumeModel resume) async {
    // delete file
    try {
      await File(resume.filePath).delete();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // remove file from hive
    await resumeBox.delete(resume.id);
  }
}
