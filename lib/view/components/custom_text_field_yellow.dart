import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomeTextFieldWthOrangeBorder extends StatelessWidget {
  final String labelName;
  final IconData iconData;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomeTextFieldWthOrangeBorder(
      {required this.labelName,
      required this.iconData,
      this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
            suffixIcon: Icon(iconData, color: Colors.amber.shade900),
            labelText: labelName,
            labelStyle: TextStyle(color: Colors.amber.shade900),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber.shade900),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }
}
