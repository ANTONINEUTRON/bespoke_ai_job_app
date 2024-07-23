import 'dart:io';

import 'package:bespoke_ai_job_app/shared/app_constants.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:bespoke_ai_job_app/shared/get_filename.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class ResumeRepository {
  var resumeBox = Hive.box<ResumeModel>(RESUME_BOX_NAME);

  Future<String> saveFile({required File file}) async {
    // get directory to store resumes
    var directory = await getApplicationSupportDirectory();
    var resumeFile =
        File("${directory.path}/resumes/${getFileName(file.path)}");
    if (!await resumeFile.exists()) await resumeFile.create(recursive: true);

    // save file to path
    await file.copy(resumeFile.path);

    // after save return path
    return resumeFile.path;
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
