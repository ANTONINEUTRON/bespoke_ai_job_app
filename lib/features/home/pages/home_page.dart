// import 'package:bespoke_ai_job_app/features/jobs/ui/pages/jobs_page.dart';
// import 'package:bespoke_ai_job_app/features/profile/ui/pages/profile_page.dart';
// import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_page.dart';
// import 'package:flutter/material.dart';
//
//
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int index = 0;
//
//   final _listOfPages = [
//     const ResumePage(),
//     const JobsPage(),
//     const ProfilePage(),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: index,
//         children: _listOfPages,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: index,
//         showUnselectedLabels: true,
//         onTap: (value) {
//           setState(() {
//             index = value;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.credit_card),
//             label: "My Jobs",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_2),
//             label: "Profile",
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:bespoke_ai_job_app/features/jobs/ui/pages/jobs_page.dart';
import 'package:bespoke_ai_job_app/features/profile/ui/pages/profile_page.dart';
import 'package:bespoke_ai_job_app/features/resume/ui/pages/resume_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final _listOfPages = [
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
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "My Jobs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
