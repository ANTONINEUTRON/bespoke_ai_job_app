

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobPostItem extends StatelessWidget {
  const JobPostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16.sp,
            right: 16.sp,
            child: Column(
              children: [
                Text("BESPOKE"),
                Icon(Icons.bookmark),
              ],
            ),
          ),
          Positioned(
            bottom: 16.sp,
            right: 16.sp,
            child: Text("35 min ago"),
          ),
          Positioned(
            bottom: 16.sp,
            left: 16.sp,
            // alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  child: Icon(Icons.business),
                ),
                SizedBox(
                  height: 16.w,
                ),
                Text(
                  "Product Design Engineer",
                  style: TextStyle(fontSize: 18.sp),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Nigeria"),
                    SizedBox(width: 16.w),
                    Text("NGN300k"),
                    SizedBox(width: 16.w),
                    Text("Remote"),
                  ],
                ),
                Text("Unilever company"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
