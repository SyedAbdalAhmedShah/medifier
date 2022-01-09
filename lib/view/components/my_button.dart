import 'package:flutter/material.dart';
import 'package:medicine_notifier/sizer.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required String this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.amber.shade900,
            borderRadius: BorderRadius.circular(10)),
        height: size.convert(context, 40),
        width: size.convertWidth(context, 130),
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
