import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrangeButton extends StatelessWidget {
  String? buttonName;
  OrangeButton({required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 50.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(offset: Offset(-1, 2))],
        color: Colors.teal,
        gradient: LinearGradient(
            colors: [Colors.orange.shade200, Colors.orange.shade900]),
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Text(
        '$buttonName',
        style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp),
      ),
    );
  }
}
