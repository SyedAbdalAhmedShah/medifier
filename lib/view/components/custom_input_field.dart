import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InputFieldReuse extends StatelessWidget {
  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  InputFieldReuse(
      {required this.title, required this.hint, this.controller, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(vertical: size.convert(context, 10)),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                  print(value);
                },
                controller: controller,
                readOnly: widget == null ? false : true,
                decoration: InputDecoration(
                  hintText: hint,
                  suffixIcon: widget,
                  // suffixIcon: widget == null
                  //     ? Container()
                  //     : Container(child: widget),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber.shade900),
                  ),
                  focusColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  contentPadding: const EdgeInsets.all(10),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
