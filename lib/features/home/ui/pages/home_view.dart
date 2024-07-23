import 'package:bespoke_ai_job_app/features/home/ui/widgets/job_post_item.dart';
import 'package:bespoke_ai_job_app/features/home/ui/widgets/profile_notice_card.dart';
import 'package:bespoke_ai_job_app/features/home/ui/widgets/search_section_widget.dart';
import 'package:bespoke_ai_job_app/features/home/ui/widgets/user_job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16.sp),
          children: [
            Text(
              "Hello, Dorcas",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text("Find job through opportunities"),
            SizedBox(
              height: 16.h,
            ),
            SearchSectionWidget(),
            SizedBox(
              height: 16.h,
            ),
            UserJobCard(),
            ProfileCompletionNoticeCard(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("See All"),
                  )
                ],
              ),
            ),
            const JobPostItem(),
          ],
        ),
      ),
    );
  }
}
