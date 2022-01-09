import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DoctorCard extends StatelessWidget {
  final String doctorName;
  final String doctorSpeciality;
  final String doctorEmail;
  final Function()? ontap;
  const DoctorCard(
      {required this.doctorName,
      required this.doctorEmail,
      required this.doctorSpeciality,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: ontap,
      //  () => Navigator.of(context).push(CustomPageRoute(
      //     child: DoctorDetailScreen(
      //   doctorModel: doctors,

      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.01,
          vertical: size.height * 0.01,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.height * 0.01,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.sp),
            color: Colors.blueGrey.shade500,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 4,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: size.width * 0.1,
              foregroundImage: AssetImage(
                'assets/no_profile-pic.jpg',
              ),
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. $doctorName',
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$doctorSpeciality',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400),
                    ),
                    SizedBox(
                      width: size.width * 0.25,
                    ),
                    Icon(Icons.keyboard_arrow_right_sharp)
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  '$doctorEmail',
                  style:
                      TextStyle(fontSize: 12.sp, color: Colors.grey.shade400),
                )
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
