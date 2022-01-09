import 'package:flutter/material.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:sizer/sizer.dart';

class CustomeTextFieldWthOrangeBorder extends StatelessWidget {
  final String labelName;
  final IconData? iconData;
  final String? Function(String?)? validator;
  final double? bordarRadius;
  final TextInputType? keyoardType;
  final TextEditingController? controller;
  const CustomeTextFieldWthOrangeBorder(
      {required this.labelName,
      this.bordarRadius,
      this.keyoardType,
      this.iconData,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyoardType,
        decoration: InputDecoration(
            suffixIcon: Icon(iconData, color: kPrimaryColor),
            labelText: labelName,
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: _outlineBorder(),
            border: _outlineBorder()),
      ),
    );
  }

  OutlineInputBorder _outlineBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.circular(bordarRadius ?? 20.sp));
  }
}
