

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCompletionNoticeCard extends StatelessWidget {
  const ProfileCompletionNoticeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        trailing: Icon(Icons.arrow_forward_ios),
        title: Text(
          "Complete your profile! 70%",
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("It is required to submit an application"),
            LinearProgressIndicator(
              value: 0.7,
            )
          ],
        ),
      ),
    );
  }
}
