import 'package:flutter/material.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:sizer/sizer.dart';

class OrangeButton extends StatelessWidget {
  Function()? ontap;
  Widget? child;
  OrangeButton({this.ontap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 7.h,
          width: 50.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(offset: Offset(-1, 2))],
            color: Colors.teal,
            gradient:
                LinearGradient(colors: [Colors.blue.shade400, kPrimaryColor]),
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: child),
    );
  }
}
