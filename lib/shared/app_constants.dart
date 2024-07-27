import 'package:bespoke_ai_job_app/gen/env.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AppConstants {
  static String RESUME_BOX_NAME = "RESUME_BOX";
  static String JOB_BOX_NAME = "JOB_BOX";

  static final  GEMINI =
      GenerativeModel(model: 'gemini-1.5-flash', apiKey: Env.geminiKey);
}
