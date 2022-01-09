import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicine_notifier/Repository/api_helper.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_bloc.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_state.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_specialty_event.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/view/components/alert_box.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/all_catagories_doctor.dart';
import 'package:medicine_notifier/view/screens/patient/doctor_detail_screen.dart';
import 'package:sizer/sizer.dart';

import 'doctors_catagories/cardiologists.dart';
import 'doctors_catagories/dentist.dart';
import 'doctors_catagories/orthopaedic.dart';

class ProgressScreen extends StatefulWidget {
  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  DoctorSpecialityBloc _bloc =
      DoctorSpecialityBloc(LoadingDoctorSpecialityState());

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _advancedDrawerController = AdvancedDrawerController();

  List<String> catagoryImages = [
    'assets/cardiology.png',
    'assets/Orthopaedic_svg.png',
    'assets/dentist.png'
  ];

  List<String> catagoryNames = ['Cardiologist', 'Orthopaedic', 'Dentist'];
  @override
  void initState() {
    _bloc.add(GetAllDoctorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        key: scaffoldKey,
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is LoadingDoctorSpecialityState) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is FetchedDoctorState) {
                return _buildBody(size, context, state.doctors);
              }
              if (state is FailureDoctorSpecialityState) {
                return Alert.dialogBox(
                    errormessage: state.error, context: context);
              }
              return CupertinoActivityIndicator();
            },
            listener: (context, state) {
              print("state iss $state");
            }));
  }

  SingleChildScrollView _buildBody(
      Size size, BuildContext context, List<DoctorModel> doctors) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.04, horizontal: size.width * 0.03),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        headingAndSeeAll(headingName: 'Catagories', context: context),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          height: size.height * 0.14,
          child: ListView.builder(
              itemCount: catagoryImages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) => Row(
                    children: [
                      catagoriesCard(size, index, context),
                    ],
                  )),
        ),
        SizedBox(height: size.height * 0.02),
        headingAndSeeAll(headingName: 'Top Doctors', context: context),
        SizedBox(height: size.height * 0.01),
        Column(
          children:
              List.generate(3, (index) => doctorCard(size, doctors[index])),
        )
      ]),
    );
  }

  InkWell doctorCard(Size size, DoctorModel doctor) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          CustomPageRoute(child: DoctorDetailScreen(doctorModel: doctor))),
      child: Container(
        padding: EdgeInsets.all(5.sp),
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.sp),
          color: Colors.white,
        ),
        // height: size.height * 0.1,
        child: Row(
          children: [
            CircleAvatar(
              foregroundColor: Colors.grey,
              radius: size.width * 0.1,
              foregroundImage: AssetImage('assets/doctorImage.png'),
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${doctor.doctorName}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '${doctor.speciality}',
                  style: TextStyle(
                      color: kgreyTextColor,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  '\$300',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(
                      '5',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.08)),
                  onPressed: () {
                    print("doctor id issss ${doctor.uid}");
                    ApiHelper().makeAppoinment(
                        uid: UserManager.user.uid!, doctorID: doctor.uid!);
                  },
                  child: Text('book'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  InkWell catagoriesCard(Size size, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToPage(index, context);
      },
      child: Container(
        margin: EdgeInsets.only(right: size.width * 0.04),
        height: size.height * 0.14,
        width: size.width * 0.27,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(catagoryImages[index]),
            SizedBox(height: size.height * 0.01),
            Text(
              catagoryNames[index],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }

  navigateToPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        return Navigator.of(context)
            .push(CustomPageRoute(child: CardiologistsScreen()));
      case 1:
        return Navigator.of(context)
            .push(CustomPageRoute(child: OrthopadicScreen()));
      default:
        return Navigator.of(context)
            .push(CustomPageRoute(child: DentistScreen()));
    }
  }

  Row headingAndSeeAll(
      {required String headingName,
      Function()? ontap,
      required BuildContext context}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(CustomPageRoute(child: AllDoctorsCatagories()));
          },
          child: Text(
            'See All',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kTextColor,
                fontSize: 13.sp),
          ),
        )
      ],
    );
  }
}
