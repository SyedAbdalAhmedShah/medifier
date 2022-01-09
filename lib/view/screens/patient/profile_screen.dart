import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medicine_notifier/Repository/api_helper.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';
import 'package:medicine_notifier/view/onBoarding/choose_for_register.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  FirebaseAuth user = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(UserManager.user.profileImage!),
                            fit: BoxFit.fill)),
                    height: size.height * 0.2,
                    width: size.width * 0.35),
              ],
            ),
            Text(
              UserManager.user.patientName!,
              style: TextStyle(fontSize: 14.sp),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4.sp)),
              height: size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoData(title: 'Email', data: UserManager.user.email!),
                  verticallPading(size),
                  Divider(
                    thickness: 2,
                  ),
                  infoData(
                      title: 'Country',
                      data: UserManager.user.country ?? 'no country'),
                  verticallPading(size),
                  Divider(
                    thickness: 2,
                  ),
                  infoData(
                      title: 'City', data: UserManager.user.city ?? 'no city'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.02),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4.sp)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  infoData(title: 'Terms & Conditions', data: ''),
                  verticallPading(size),
                  Divider(
                    thickness: 2,
                  ),
                  infoData(title: 'About Us', data: ''),
                  verticallPading(size),
                  Divider(
                    thickness: 2,
                  ),
                  TextButton(
                      onPressed: () async {
                        ApiHelper().logOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => ChooseForRegistration()));
                      },
                      child: Text('Log Out'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox verticallPading(Size size) {
    return SizedBox(
      height: size.height * 0.01,
    );
  }

  Row infoData({required String title, required String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(data)],
    );
  }
}
