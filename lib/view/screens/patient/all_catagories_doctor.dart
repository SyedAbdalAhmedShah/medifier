import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/Radiologists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/anesthesiologists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/cardiologists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/dentist.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/dermatologists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/general_surgeon.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/neurologists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/orthopaedic.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/others_doctors.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/plastic_surgeon.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/psychiatrists.dart';
import 'package:medicine_notifier/view/screens/patient/doctors_catagories/urologists.dart';
import 'package:sizer/sizer.dart';

class AllDoctorsCatagories extends StatelessWidget {
  List<String> doctorsCatagoryNames = [
    'PSYCHIATRISTS',
    'RADIOLOGISTS',
    'ANESTHESIOLOGISTS',
    'CARDIOLOGISTS',
    'UROLOGISTS',
    'DERMATOLOGIST',
    'GENERAL SURGEONS',
    'PLASTIC SURGEONS ',
    'ORTHOPAEDIC',
    'DENTIST',
    'NEUROLOGISTS',
    'OTHERS',
  ];
  List<LinearGradient> gradientColors = [
    LinearGradient(colors: [Colors.teal.shade300, Colors.teal.shade800]),
    // LinearGradient(colors: [Colors.yellow.shade400, Colors.yellow.shade800]),
    // LinearGradient(colors: [Colors.purple.shade400, Colors.purple.shade800]),
    // LinearGradient(colors: [Colors.red.shade400, Colors.red.shade700]),
    // LinearGradient(
    //     colors: [Colors.limeAccent.shade400, Colors.limeAccent.shade700]),
    // LinearGradient(
    //     colors: [Colors.lightGreen.shade400, Colors.lightGreen.shade800]),
    // LinearGradient(colors: [Colors.yellow.shade400, Colors.yellow.shade800]),
    // LinearGradient(colors: [Colors.indigo.shade400, Colors.indigo.shade800]),
    LinearGradient(
        colors: [Colors.blueGrey.shade400, Colors.blueGrey.shade800]),
    LinearGradient(colors: [Colors.blue.shade300, Colors.blue.shade700]),
    // LinearGradient(colors: [Colors.brown.shade400, Colors.brown.shade800]),
    // LinearGradient(colors: [Colors.yellow.shade400, Colors.yellow.shade800]),
    // LinearGradient(colors: [Colors.pink.shade400, Colors.pink.shade800]),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Catagories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: doctorsCatagoryNames.length,
                  itemBuilder: (_, index) => doctors(size, index, context)),
            )
          ],
        ),
      ),
    );
  }

  InkWell doctors(Size size, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToTheDoctorScreen(index, context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
        alignment: Alignment.center,
        margin: EdgeInsets.all(5.sp),
        height: size.height * 0.1,
        decoration: decoration(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/catagory_doctor.svg',
              fit: BoxFit.fill,
              width: size.width * 0.05,
              height: size.height * 0.08,
            ),
            Text(
              doctorsCatagoryNames[index],
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.keyboard_arrow_right_rounded)
          ],
        ),
      ),
    );
  }

  navigateToTheDoctorScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Navigator.of(context)
            .push(CustomPageRoute(child: PsychiatristsScreen()));

      case 1:
        return Navigator.of(context)
            .push(CustomPageRoute(child: RadiologistsScreen()));

      case 2:
        return Navigator.of(context)
            .push(CustomPageRoute(child: AnesthesiologistsScreen()));

      case 3:
        return Navigator.of(context)
            .push(CustomPageRoute(child: CardiologistsScreen()));

      case 4:
        return Navigator.of(context)
            .push(CustomPageRoute(child: UrologistsScreen()));

      case 5:
        return Navigator.of(context)
            .push(CustomPageRoute(child: DermatologistsScreen()));

      case 6:
        return Navigator.of(context)
            .push(CustomPageRoute(child: GeneralSurgeonScreen()));

      case 7:
        return Navigator.of(context)
            .push(CustomPageRoute(child: PlasticSurgeonScreen()));

      case 8:
        return Navigator.of(context)
            .push(CustomPageRoute(child: OrthopadicScreen()));

      case 9:
        return Navigator.of(context)
            .push(CustomPageRoute(child: DentistScreen()));

      case 10:
        return Navigator.of(context)
            .push(CustomPageRoute(child: NeurologistsScreen()));

      default:
        Navigator.of(context)
            .push(CustomPageRoute(child: OthersDoctorScreen()));
    }
  }

  BoxDecoration decoration(int index) {
    int colorIndex = index % gradientColors.length;
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5.sp),
      gradient: gradientColors[colorIndex],
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    );
  }
}
