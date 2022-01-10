import 'package:flutter/material.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/sizer.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/strings.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/book_appoinment/booking_appoinment.dart';

class DoctorDetailScreen extends StatelessWidget {
  final DoctorModel doctorModel;

  DoctorDetailScreen({required this.doctorModel});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 200,
              centerTitle: true,
              leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  )),
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Dr. ${doctorModel.doctorName}',
                  ),
                  background: Image(
                    image: AssetImage('assets/no_profile-pic.jpg'),
                    fit: BoxFit.fill,
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          doctorModel.speciality ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    verticalGap(size),
                    heading('About Doctor'),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: size.height * 0.01),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          border: Border.all(color: Colors.white60)),
                      child: Text(FirebaseStrings.dummyText),
                    ),
                    verticalGap(size),
                    heading('Email'),
                    Text("${doctorModel.email}"),
                    verticalGap(size),
                    verticalGap(size),
                    heading('Clinic Name'),
                    Text("${doctorModel.clinicName}"),
                    verticalGap(size),
                    verticalGap(size),
                    heading('Checkup Timing'),
                    Text("{checkUptiming}"),
                    verticalGap(size),
                    verticalGap(size),
                    heading('Checkup Free'),
                    Text("{checkUptiming}"),
                    verticalGap(size),
                    verticalGap(size),
                    heading('contact number'),
                    Text("{checkUptiming}")
                  ],
                ),
              )
            ]))
          ],
        ),
        bottomNavigationBar: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                primary: kPrimaryColor),
            onPressed: () {
              Navigator.of(context).push(CustomPageRoute(
                  child: BookingAppoinment(
                doctorUid: doctorModel.uid!,
              )));
            },
            child: Text('Book A Appoinment')),
      ),
    );
  }

  SizedBox verticalGap(Size size) {
    return SizedBox(
      height: size.height * 0.01,
    );
  }

  Text heading(String name) {
    return Text(
      name,
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white60),
    );
  }
}

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minExtend;
  CustomSliverAppBar(this.expandedHeight, this.minExtend);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
