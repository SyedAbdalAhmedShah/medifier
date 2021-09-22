import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_notifier/view/repeted_widget/button.dart';
import 'package:medicine_notifier/view/repeted_widget/title.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 2.h,
            ),
            TitleWidget(
              title: "Signup",
            ),
            Container(
              height: 23.h,
              width: 45.w,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber.shade900,
                  ),
                  color: Colors.orange,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/no_picture.png'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.person_outline,
                        color: Colors.amber.shade900),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.amber.shade900),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
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
                    suffixIcon: Icon(Icons.email_outlined,
                        color: Colors.amber.shade900),
                    focusColor: Colors.amber.shade900,
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.amber.shade900),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(20.sp)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(20.sp))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: TextField(
                decoration: InputDecoration(
                    suffixStyle: TextStyle(color: Colors.amber.shade900),
                    suffixIcon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.amber.shade900,
                    ),
                    focusColor: Colors.amber.shade900,
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.amber.shade900),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(20.sp)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber.shade900),
                        borderRadius: BorderRadius.circular(20.sp))),
              ),
            ),
            OrangeButton(buttonName: 'Signup')
          ],
        ),
      ),
    );
  }
}
