import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SliderPage extends StatelessWidget {
  // final String? title;
  // final String? desc;
  final String? image;
  const SliderPage({
    // this.title,
    // this.desc,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('$image'),
            fit: BoxFit.fill,
          ),

          // Text('$title'),
          // SizedBox(
          //   height: 8.h,
          // ),
          // Text('$desc'),
        ],
      ),
    );
  }
}
