import 'package:flutter/material.dart';
import 'package:medicine_notifier/sizer.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:sizer/sizer.dart';

class DoctorScreen extends StatelessWidget {
  List<String> speciality = [
    'Dentist',
    'Cosmetic/Aesthetic Dentist',
    'Implantologist',
    'Oral Pathologist'
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.04, horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                personalInfp(screenHeight, screenWidth),
                vertivalyyPading(screenHeight),
                Row(
                  children: [
                    iconWithName(
                        screenHeight, screenWidth, "4.5", "Rating", Icons.star),
                    SizedBox(
                      width: screenWidth * 0.05,
                    ),
                    iconWithName(screenHeight, screenWidth, "17+ Year",
                        "Experience", Icons.star),
                  ],
                ),
                vertivalyyPading(screenHeight),
                heading('Biography'),
                description(),
                vertivalyyPading(screenHeight),
                heading('Specialities'),
                specialities(),
                heading('Consultation Fee'),
                const Text(
                  '\$200.00',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                vertivalyyPading(screenHeight),
                heading('Availability'),
                const Text(
                  '10:30 AM To 02:30 PM',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                vertivalyyPading(screenHeight),

                vertivalyyPading(screenHeight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(text: '0 '),
                          TextSpan(
                              text: 'Consultations available',
                              style: TextStyle(fontWeight: FontWeight.w300))
                        ])),
                  ],
                ),
                // vertivalyyPading(screenHeight),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Wrap specialities() {
    return Wrap(
      children: List.generate(
          speciality.length,
          (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(7.sp)),
                child: Text(
                  speciality[index],
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
              )),
    );
  }

  RichText description() {
    return RichText(
        text: const TextSpan(
            style: TextStyle(
                color: kchipBackgroundColor, fontWeight: FontWeight.w300),
            children: [
          TextSpan(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
          TextSpan(
              text: 'Read More', style: TextStyle(fontWeight: FontWeight.w500))
        ]));
  }

  Text heading(String headingName) {
    return Text(
      headingName,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
    );
  }

  SizedBox vertivalyyPading(double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.03,
    );
  }

  Row iconWithName(double screenHeight, double screenWidth, String name1,
      String name2, IconData iconData) {
    return Row(
      children: [
        Container(
          height: screenHeight * 0.08,
          width: screenWidth * 0.08,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
            color: kPrimaryColor,
          ),
          child: Icon(
            iconData,
            size: 5.h,
          ),
        ),
        SizedBox(
          width: screenWidth * 0.02,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name1,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kPrimaryColor),
            ),
            Text(
              name2,
              style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor),
            )
          ],
        )
      ],
    );
  }

  Row personalInfp(double screenHeight, double screenWidth) {
    return Row(
      children: [
        doctorProfilePic(screenHeight, screenWidth),
        nameAndEdu(screenHeight)
      ],
    );
  }

  Container nameAndEdu(double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dr.John Doe',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
          Text(
            'BDS, MDS - Prosthodontics',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
                fontSize: 11.sp),
          ),
          Text(
            'St Angel Clinic',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: kPrimaryColor,
                fontSize: 11.sp),
          )
        ],
      ),
    );
  }

  Container doctorProfilePic(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.15,
      width: screenWidth * 0.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.sp),
        color: kPrimaryColor,
      ),
      child: Icon(
        Icons.person_rounded,
        size: 7.h,
      ),
    );
  }
}
 
        //  Container(
        //   decoration: BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage(
        //               'medifier/assets/sharon-mccutcheon-FEPfs43yiPE-unsplash.jpg'))),
        //   child: DraggableScrollableSheet(
        //       expand: true,
        //       initialChildSize: 0.8,
        //       minChildSize: 0.8,
        //       maxChildSize: 0.9,
        //       builder: (_, scrollController) => SingleChildScrollView(
        //             controller: scrollController,
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   borderRadius: BorderRadius.only(
        //                       topLeft: Radius.circular(12.sp),
        //                       topRight: Radius.circular(12.sp))),
        //               height: MediaQuery.of(context).size.height,
        //             ),
        //           )),
        // )