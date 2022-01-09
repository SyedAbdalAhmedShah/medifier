import 'package:flutter/material.dart';
import 'package:medicine_notifier/view/components/custom_text_field_yellow.dart';

class BookingAppoinment extends StatelessWidget {
  const BookingAppoinment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Book Appoinment')),
      body: Column(
        children: [
          CustomeTextFieldWthOrangeBorder(
              bordarRadius: 10,
              labelName: 'patient name',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'patient Age',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'Disease',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'Description',
              validator: (value) {}),
        ],
      ),
    );
  }
}
