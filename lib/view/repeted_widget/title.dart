import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class TitleWidget extends StatelessWidget {
  String? title;
   TitleWidget({
   this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 7.w),
      child: Row(
        children: [
          Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.amber.shade900,
                shadows: [Shadow(offset: Offset(-1, 2))]),
          ),
        ],
      ),
    );
  }
}