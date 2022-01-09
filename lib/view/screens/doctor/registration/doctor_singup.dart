import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_notifier/blocs/signup_bloc/signup_bloc.dart';
import 'package:medicine_notifier/blocs/signup_bloc/signup_event.dart';
import 'package:medicine_notifier/blocs/signup_bloc/signup_states.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/view/components/alert_box.dart';
import 'package:medicine_notifier/view/components/button.dart';
import 'package:medicine_notifier/view/components/custom_text_field_yellow.dart';

import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/nav_bar_screens/nav_bar_all_screens.dart';

import 'package:sizer/sizer.dart';

class DoctorSignUp extends StatefulWidget {
  @override
  State<DoctorSignUp> createState() => _DoctorSignUpState();
}

class _DoctorSignUpState extends State<DoctorSignUp> {
  final emailController = TextEditingController();
  final doctorNameController = TextEditingController();
  final clinicNameController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth user = FirebaseAuth.instance;

  List<String> doctorsCatagory = [
    'PSYCHIATRISTS',
    'NEUROLOGISTS',
    'RADIOLOGISTS',
    'ANESTHESIOLOGISTS',
    'CARDIOLOGISTS',
    'UROLOGISTS',
    'DERMATOLOGIST',
    'GENERAL SURGEONS',
    'PLASTIC SURGEONS ',
    'ORTHOPAEDIC',
    'DENTIST',
    'OTHERS',
  ];

  String selectedCatagory = 'Select Speciality';

  SingupBloc _bloc = SingupBloc();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(" Doctor Signup",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: Colors.amber.shade900,
                shadows: [Shadow(offset: Offset(-1, 2))])),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            // Container(
            //   height: 23.h,
            //   width: 45.w,
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //         color: Colors.amber.shade900,
            //       ),
            //       color: Colors.orange,
            //       shape: BoxShape.circle,
            //       image: DecorationImage(
            //           image: AssetImage('assets/no_picture.png'),
            //           fit: BoxFit.cover)),
            // ),
            CustomeTextFieldWthOrangeBorder(
              labelName: 'Doctor Name',
              iconData: Icons.person_outline,
              controller: doctorNameController,
              validator: (value) {
                if (value!.length < 0) {
                  return 'please enter the doctor name ';
                }
              },
            ),
            CustomeTextFieldWthOrangeBorder(
              labelName: 'Clinic Name',
              controller: clinicNameController,
              iconData: Icons.person_outline,
              validator: (value) {
                if (value!.length < 0) {
                  return 'please enter the doctor name ';
                }
              },
            ),

            CustomeTextFieldWthOrangeBorder(
              controller: emailController,
              labelName: 'Email',
              iconData: Icons.email_outlined,
              validator: (value) {
                if (value!.length < 0) {
                  return 'please enter the doctor name ';
                }
              },
            ),
            CustomeTextFieldWthOrangeBorder(
              controller: passwordController,
              labelName: 'Password',
              iconData: Icons.remove_red_eye_outlined,
              validator: (value) {
                if (value!.length < 0) {
                  return 'please enter the doctor name ';
                }
              },
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 0.5.h),
              margin: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(color: Colors.white54)),
              child: DropdownButton<String>(
                  hint: Text(
                    selectedCatagory,
                    style: TextStyle(
                        color: Colors.amber.shade900,
                        fontWeight: FontWeight.w400),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.amber.shade900,
                  ),
                  underline: Container(color: Colors.white),
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      selectedCatagory = value!;
                    });
                    print(selectedCatagory);
                  },
                  items: doctorsCatagory.map(
                    (language) {
                      return DropdownMenuItem<String>(
                        value: language,
                        child: Text(language),
                      );
                    },
                  ).toList()),
            ),

            // Padding(
            //   padding: EdgeInsets.all(12.sp),
            //   child: TextFormField(
            //     controller: emailController,
            //     decoration: InputDecoration(
            //         suffixIcon: Icon(Icons.email_outlined,
            //             color: Colors.amber.shade900),
            //         focusColor: Colors.amber.shade900,
            //         labelText: 'Email',
            //         labelStyle: TextStyle(color: Colors.amber.shade900),
            //         focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(color: Colors.amber.shade900),
            //             borderRadius: BorderRadius.circular(20.sp)),
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide(color: Colors.amber.shade900),
            //             borderRadius: BorderRadius.circular(20.sp))),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.all(12.sp),
            //   child: TextFormField(
            //     controller: passwordController,
            //     decoration: InputDecoration(
            //         suffixStyle: TextStyle(color: Colors.amber.shade900),
            //         suffixIcon: Icon(
            //           Icons.remove_red_eye_outlined,
            //           color: Colors.amber.shade900,
            //         ),
            //         focusColor: Colors.amber.shade900,
            //         labelText: 'Password',
            //         labelStyle: TextStyle(color: Colors.amber.shade900),
            //         focusedBorder: OutlineInputBorder(
            //             borderSide: BorderSide(color: Colors.amber.shade900),
            //             borderRadius: BorderRadius.circular(20.sp)),
            //         border: OutlineInputBorder(
            //             borderSide: BorderSide(color: Colors.amber.shade900),
            //             borderRadius: BorderRadius.circular(20.sp))),
            //   ),
            // ),
            BlocConsumer(
                listener: (context, state) {
                  print(state);
                  if (state is SuccessSingupState) {
                    Navigator.of(context)
                        .push(CustomPageRoute(child: NavBarScreens()));
                  }
                  if (state is FailureSingupState) {
                    Alert.dialogBox(
                        errormessage: state.message, context: context);
                  }
                },
                bloc: _bloc,
                builder: (context, state) {
                  return OrangeButton(
                    child: state is LoadingSingupState
                        ? CupertinoActivityIndicator()
                        : Text(
                            'SignUp',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                    ontap: () {
                      DoctorModel doctorInfo = DoctorModel(
                        clinicName: clinicNameController.text,
                        doctorName: doctorNameController.text,
                        email: emailController.text,
                        speciality: selectedCatagory,
                      );

                      _bloc.add(DoctorSignupEvent(
                          doctorModel: doctorInfo,
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
