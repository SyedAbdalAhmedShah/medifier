import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_bloc.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_event.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_state.dart';
import 'package:medicine_notifier/model/make_appoinment.dart';
import 'package:medicine_notifier/sizer.dart';
import 'package:medicine_notifier/view/components/alert_box.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/custom_text_field_yellow.dart';
import 'package:medicine_notifier/view/components/my_button.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/home_screen.dart';
import 'package:medicine_notifier/view/screens/patient/nav_bar_screens/nav_bar_all_screens.dart';
import 'package:sizer/sizer.dart';

class BookingAppoinment extends StatefulWidget {
  final String doctorUid;
  const BookingAppoinment({required this.doctorUid});

  @override
  State<BookingAppoinment> createState() => _BookingAppoinmentState();
}

class _BookingAppoinmentState extends State<BookingAppoinment> {
  final key = GlobalKey<FormState>();
  MakeAppoinmentBloc _bloc = MakeAppoinmentBloc();
  TextEditingController patientNameCont = TextEditingController();
  TextEditingController patientAgeCont = TextEditingController();
  TextEditingController diseaseCont = TextEditingController();
  TextEditingController descriptionCont = TextEditingController();

  String selectedTime = 'Please Select time ';
  String selectedtDate = 'Please Select date ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Book Appoinment')),
        body: BlocConsumer(
            bloc: _bloc,
            builder: (context, state) {
              return _buildBody();
            },
            listener: (context, state) {
              if (state is FailureMakeAppoinmentState) {
                Alert.dialogBox(errormessage: state.error, context: context);
              }
              if (state is SuccessFullyMakeAppoinmentState) {
                Alert.dialogBox(
                    errormessage: "your Appoinment Added SuccessFully",
                    context: context,
                    onTap: () => Navigator.of(context).pushAndRemoveUntil(
                        CustomPageRoute(child: (NavBarScreens())),
                        (route) => false));
              }
            }));
  }

  Form _buildBody() {
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          CustomeTextFieldWthOrangeBorder(
              controller: patientNameCont,
              bordarRadius: 10,
              labelName: 'patient name',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              controller: patientAgeCont,
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'patient Age',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              controller: diseaseCont,
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'Disease',
              validator: (value) {}),
          CustomeTextFieldWthOrangeBorder(
              controller: descriptionCont,
              bordarRadius: 10,
              keyoardType: TextInputType.number,
              labelName: 'Description',
              validator: (value) {}),
          InkWell(
            onTap: _timePicker,
            child: pickTimeWidget(time: selectedTime),
          ),
          InkWell(
            onTap: _datePikcer,
            child: pickTimeWidget(time: selectedtDate),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 10.w)),
              onPressed: () {
                // MakeAppoinment appoinment = MakeAppoinment(
                //   pateintName: patientNameCont.text.trim(),
                //   pateintAge: patientNameCont.text.trim(),
                //   patientUid: UserManager.user.uid,
                //   disease: diseaseCont.text.trim(),
                //   doctorUid: widget.doctorUid,
                //   description: descriptionCont.text,
                //   date: selectedtDate,
                //   time: selectedTime,
                // );

                Map<String, dynamic> appoinment = {
                  'pateintName': patientNameCont.text.trim(),
                  'pateintAge': patientAgeCont.text.trim(),
                  'disease': diseaseCont.text.trim(),
                  'description': descriptionCont.text,
                  'time': selectedTime,
                  'date': selectedtDate,
                  'doctorUid': widget.doctorUid,
                  'patientUid': UserManager.user.uid
                };
                _bloc.add(CreateAppoinmentState(appoinment: appoinment));
              },
              child: _bloc.state is LoadingMakeAppoinmentState
                  ? Center(child: CupertinoActivityIndicator())
                  : Text('Create An Appoinment'))
        ],
      ),
    );
  }

  _datePikcer() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    final formateddate = DateFormat('dd/MM/yyyy').format(date!);

    print(formateddate.toString());
    setState(() {
      selectedtDate = formateddate.toString();
    });
  }

  _timePicker() async {
    TimeOfDay? time = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    setState(() {
      selectedTime = time!.format(context);
    });
    print(time!.format(context));
  }

  Container pickTimeWidget({required String time}) {
    return Container(
      height: 7.5.h,
      margin: EdgeInsets.all(12.sp),
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          border: Border.all(color: kTextColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(time), Icon(Icons.alarm)],
      ),
    );
  }
}
