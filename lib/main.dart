import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:medicine_notifier/view/onBoarding/onboarding_screen.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (ctx, o, t) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // scaffoldBackgroundColor: Colors.amber.shade900,
          appBarTheme: AppBarTheme(backgroundColor: Colors.amber.shade900),
          textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black54)),

          buttonTheme: ButtonThemeData(buttonColor: Colors.black54),

          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
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
          child: OnBoardingScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Lottie.asset(
        'assets/47383-doctor-welcoming-pacient.json',
      ),
    );
  }
}
