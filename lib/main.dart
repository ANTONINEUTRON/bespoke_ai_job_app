import 'package:bespoke_ai_job_app/features/home/pages/signIn/signIn.dart';
import 'package:bespoke_ai_job_app/features/jobs/blocs/jobs_bloc.dart';
import 'package:bespoke_ai_job_app/features/jobs/data/model/job.dart';
import 'package:bespoke_ai_job_app/shared/app_constants.dart';
import 'package:bespoke_ai_job_app/features/resume/bloc/resume_bloc.dart';
import 'package:bespoke_ai_job_app/features/resume/data/model/resume_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // Initialize HIVE
  await Hive.initFlutter();
  //TypeID 1
  Hive.registerAdapter(ResumeModelImplAdapter());
  Hive.registerAdapter(JobImplAdapter());

  await Hive.openBox<ResumeModel>(AppConstants.RESUME_BOX_NAME);
  await Hive.openBox<Job>(AppConstants.JOB_BOX_NAME);
  await Firebase.initializeApp();
  
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(390, 844),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResumeBloc(),
        ),
        BlocProvider(
          create: (context) => JobsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Bespoke',
        theme: ThemeData(
          // primaryColor: Colors.teal,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,primary: Colors.teal),
          useMaterial3: true,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Color(0XFF092C4C),
            unselectedItemColor: Color(0XFF6A6A6A),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.sp),
              ),
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SignIn(),
        
      ),
    );
  }
}
