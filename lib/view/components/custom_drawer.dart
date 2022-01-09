import 'package:flutter/material.dart';
import 'package:medicine_notifier/Repository/api_helper.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';
import 'package:medicine_notifier/view/onBoarding/choose_for_register.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/registration/patient_login.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  ApiHelper helper = ApiHelper();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          _buildHeader(size),
          drawerItem(size: size, iconData: Icons.home, title: 'Home'),
          divider(size),
          drawerItem(
              size: size,
              iconData: Icons.bookmark_add,
              title: 'My Appointment'),
          divider(size),
          drawerItem(
              size: size,
              iconData: Icons.settings,
              title: 'Setting',
              callBack: () {}),
          divider(size),
          drawerItem(
              size: size,
              iconData: Icons.lock,
              title: 'Logout',
              callBack: () {
                helper.logOut();
                Navigator.of(context).pushReplacement(
                    CustomPageRoute(child: ChooseForRegistration()));
              }),
          divider(size),
        ],
      ),
    );
  }

  Divider divider(Size size) {
    return Divider(
      endIndent: size.width * 0.04,
      indent: size.width * 0.02,
    );
  }

  ListTile drawerItem(
      {required Size size,
      required String title,
      Function()? callBack,
      required IconData iconData}) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(
          size.width * 0.02, size.height * 0.01, size.width * 0.02, 0),
      leading: Icon(iconData),
      title: Text(title),
      trailing: Icon(Icons.keyboard_arrow_right_outlined),
      onTap: callBack,
    );
  }

  Container _buildHeader(Size size) {
    return Container(
      height: size.height * 0.23,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue.shade500,
        kPrimaryColor,
      ])),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size.width * 0.12,
              foregroundImage: NetworkImage(UserManager.user.profileImage!),
            ),
            SizedBox(
              height: size.height * 0.012,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Welcome, ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "${UserManager.user.patientName}", style: textStyle())
              ]),
            ),
            Text(
              '${UserManager.user.email}',
              style: textStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle() =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
}
