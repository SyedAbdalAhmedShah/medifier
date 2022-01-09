import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:medicine_notifier/model/patient_model.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/strings.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';

import 'package:medicine_notifier/view/onBoarding/onboarding_screen.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';

import 'package:medicine_notifier/view/screens/patient/home_screen.dart';
import 'package:medicine_notifier/view/screens/patient/nav_bar_screens/nav_bar_all_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'local database/local_database.dart';
import 'local database/shared_prefrences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await DbHelper.initDB();

  await UserSharedPrefrencess.initSP();
  await checkIsNewUser();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (ctx, o, t) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          // scaffoldBackgroundColor: Colors.amber.shade900,
          appBarTheme: AppBarTheme(backgroundColor: kPrimaryColor),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white54)),

          buttonTheme: ButtonThemeData(buttonColor: Colors.black54),

          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

Future checkIsNewUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // print("user manager LogedIn ==== ${UserManager.isUserLogedIn}");
  UserManager.isUserLogedIn =
      preferences.containsKey(FirebaseStrings.isLogedIn);
  if (preferences.containsKey(FirebaseStrings.userKey)) {
    final userInfo =
        json.decode(preferences.getString(FirebaseStrings.userKey)!);
    print('UserInfo $userInfo');
    UserManager.user = PatientModel.fromJson(userInfo);
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Navigator.of(context).pushReplacement(
        CustomPageRoute(
          child:
              UserManager.isUserLogedIn ? NavBarScreens() : OnBoardingScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Lottie.asset(
          'assets/47383-doctor-welcoming-pacient.json',
        ),
      ),
    );
  }
}
