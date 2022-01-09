import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Alert {
  static dialogBox(
      {required String errormessage, required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Text(
                errormessage,
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              title: Text(
                'Alert!',
                style: TextStyle(color: Colors.black),
              ),
              actionsPadding: EdgeInsets.all(5),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ));
  }
}
