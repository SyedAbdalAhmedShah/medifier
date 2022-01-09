import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_bloc.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_state.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_specialty_event.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/sizer.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/doctor_detail_screen.dart';
import 'package:sizer/sizer.dart';

class TopDoctors extends StatefulWidget {
  @override
  State<TopDoctors> createState() => _TopDoctorsState();
}

class _TopDoctorsState extends State<TopDoctors> {
  DoctorSpecialityBloc _bloc =
      DoctorSpecialityBloc(LoadingDoctorSpecialityState());

  @override
  void initState() {
    _bloc.add(GetAllDoctorsEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              if (state is LoadingDoctorSpecialityState) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              if (state is FetchedDoctorState) {
                return _buildBody(size, state.doctors);
              }
              return CupertinoActivityIndicator();
            },
            listener: (context, state) {
              print('state is $state');
            }));
  }

  GridView _buildBody(Size size, List<DoctorModel> doctors) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: size.height * 0.4,
          mainAxisExtent: size.height * 0.34,
          childAspectRatio: 3 / 2,
        ),
        itemCount: doctors.length,
        itemBuilder: (BuildContext ctx, index) {
          final doctor = doctors[index];
          return _buildCard(size, doctor);
        });
  }

  InkWell _buildCard(Size size, DoctorModel doctor) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          CustomPageRoute(child: DoctorDetailScreen(doctorModel: doctor))),
      child: Container(
        // padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(
            top: size.height * 0.02,
            left: size.width * 0.03,
            right: size.width * 0.03),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15.sp),
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
            CircleAvatar(
              radius: size.width * 0.1,
              foregroundImage: AssetImage('assets/doctorImage.png'),
            ),
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
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$300',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Icon(Icons.star, color: Colors.amber, size: size.width * 0.04),
                Text(
                  '4.5',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.1,
                      vertical: size.height * 0.01)),
              child: Text('Book'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
