

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserJobCard extends StatelessWidget {
  const UserJobCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Stack(
        children: [
          CircularProgressIndicator(
            value: 0.5,
            color: Colors.red,
            backgroundColor: Colors.white,
          ),
          Align(
            alignment: Alignment.topRight,
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text("Upload Resume"),
              icon: Icon(Icons.upload_file),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Mobile Application Developer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Colors.white,),
                    Text(
                      "Nigeria",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  "Active",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  "Fulltime",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
