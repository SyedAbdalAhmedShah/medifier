import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart' as img;
import 'package:medicine_notifier/blocs/signup_bloc/signup_bloc.dart';
import 'package:medicine_notifier/blocs/signup_bloc/signup_event.dart';
import 'package:medicine_notifier/blocs/signup_bloc/signup_states.dart';
import 'package:medicine_notifier/model/patient_model.dart';
import 'package:medicine_notifier/sizer.dart';
import 'package:medicine_notifier/view/components/alert_box.dart';
import 'package:medicine_notifier/view/components/button.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';

import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/nav_bar_screens/nav_bar_all_screens.dart';

import 'package:sizer/sizer.dart';

class PatientSignup extends StatefulWidget {
  @override
  State<PatientSignup> createState() => _PatientSignupState();
}

class _PatientSignupState extends State<PatientSignup> {
  FirebaseStorage storage = FirebaseStorage.instance;

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final passwordController = TextEditingController();

  SingupBloc _bloc = SingupBloc();

  img.ImagePicker _picker = img.ImagePicker();
  File? imagePath;
  String imageName = '';
  DateTime dateTime = DateTime.now();

  var firebaseImageUrl;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Patient Signup",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
                color: kTextColor,
                shadows: [Shadow(offset: Offset(-1, 2))])),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            GestureDetector(
              onTap: () async {
                await pickProfileImage();
              },
              child: profileImageVIewer(),
            ),
            usernameField(),
            emailField(),
            passwordField(),
            countryField(),
            cityField(),
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
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp),
                        ),
                  ontap: () async {
                    PatientModel pateint = PatientModel(
                      email: emailController.text,
                      patientName: nameController.text,
                      city: cityController.text,
                      country: countryController.text,
                    );
                    _bloc.add(UserSingupEvent(
                        patientModel: pateint,
                        password: passwordController.text,
                        imageName: imageName,
                        imagePath: imagePath!.path));
                  },
                );
              },
            ),
            SizedBox(
              height: size.convert(context, 30),
            )
          ],
        ),
      ),
    );
  }

  Padding emailField() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.email_outlined, color: kPrimaryColor),
            focusColor: kPrimaryColor,
            labelText: 'Email',
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }

  Padding usernameField() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: nameController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.person_outline, color: kPrimaryColor),
            labelText: 'Username',
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }

  Padding cityField() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: cityController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.location_city, color: kPrimaryColor),
            labelText: 'city',
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }

  Padding countryField() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: countryController,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.house, color: kPrimaryColor),
            labelText: 'country',
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }

  Container profileImageVIewer() {
    return Container(
      alignment: Alignment.center,
      height: 23.h,
      width: 45.w,
      decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
          ),
          color: Colors.orange,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: imagePath == null
                  ? AssetImage('assets/no_picture.png')
                  : FileImage(imagePath!) as ImageProvider,
              fit: BoxFit.cover)),
      child: Text(
          imagePath == null ? 'Please Click To Set Profile picture' : '',
          textAlign: TextAlign.center,
          style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
    );
  }

  Future pickProfileImage() async {
    img.XFile? pickedImage =
        await _picker.pickImage(source: img.ImageSource.gallery);

    if (pickedImage != null) {
      print("picked Image ===== ${pickedImage.path}");
      setState(() {
        imagePath = File(pickedImage.path);
        imageName = pickedImage.name;
      });
    }

    print(imageName);
  }

  Padding passwordField() {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
            suffixStyle: TextStyle(color: kPrimaryColor),
            suffixIcon: Icon(
              Icons.remove_red_eye_outlined,
              color: kPrimaryColor,
            ),
            focusColor: kPrimaryColor,
            labelText: 'Password',
            labelStyle: TextStyle(color: kTextColor),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(20.sp))),
      ),
    );
  }
}
