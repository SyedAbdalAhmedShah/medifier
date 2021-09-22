import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/registration/login.dart';
import 'package:medicine_notifier/view/registration/signup.dart';
import 'package:sizer/sizer.dart';

class ChooseForRegistration extends StatelessWidget {
  const ChooseForRegistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/38435-register.json'),
            InkWell(
              onTap: () {
                print('login Pressed');
                Navigator.of(context).push(
                  CustomPageRoute(
                    child: Login(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(offset: Offset(-1, 2))],
                    color: Colors.teal,
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade300, Colors.blue.shade900]),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.sp),
                        topLeft: Radius.circular(5.sp))),
                height: 7.h,
                width: 50.w,
                child: Text(
                  'Login',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                print('Signup Pressed');
                Navigator.of(context).push(CustomPageRoute(child: Signup()));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    boxShadow: [BoxShadow(offset: Offset(-1, 2))],
                    gradient: LinearGradient(
                        colors: [Colors.teal.shade300, Colors.teal.shade900]),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(5.sp))),
                height: 7.h,
                width: 55.w,
                child: Text(
                  'Signup',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
