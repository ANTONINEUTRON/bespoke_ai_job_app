import 'package:bespoke_ai_job_app/features/home/ui/pages/home_view.dart';
import 'package:bespoke_ai_job_app/features/jobs/ui/pages/jobs_page.dart';
import 'package:bespoke_ai_job_app/features/profile/ui/pages/profile_page.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final _listOfPages = [
    const HomeView(),
    const ResumePage(),
    const JobsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _listOfPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description_outlined),
            label: "Resume",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "My Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
