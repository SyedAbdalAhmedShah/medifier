import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:medicine_notifier/view/home/home_screen.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/repeted_widget/button.dart';
import 'package:medicine_notifier/view/repeted_widget/title.dart';

import 'package:sizer/sizer.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/doctor_outline.jpg'),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleWidget(
              title: "Login",
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person_outline,
                        color: Colors.amber.shade900),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.amber.shade900),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.amber.shade900,
                        ),
                        borderRadius: BorderRadius.circular(20.sp)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.sp))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: Colors.amber.shade900),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.amber.shade900),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(20.sp)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20.sp))),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(CustomPageRoute(child: HomeScreen()));
              },
              child: OrangeButton(
                buttonName: 'Login',
              ),
            )
          ],
        ),
      ),
    );
  }
}
