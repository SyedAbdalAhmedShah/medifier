// import 'package:flutter/material.dart';

// import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
// import 'package:medicine_notifier/view/screens/home_screen.dart';
// import 'package:sizer/sizer.dart';

// class AddMedicinesScreen extends StatefulWidget {
//   @override
//   State<AddMedicinesScreen> createState() => _AddMedicinesScreenState();
// }

// class _AddMedicinesScreenState extends State<AddMedicinesScreen> {
//   int currentStep = 0;
//   String? time;
//   String? _selectedTime;

//   bool isActive(int index) {
//     if (index >= 0) {
//       return true;
//     } else
//       return false;
//   }

//   Future<void> _show() async {
//     final TimeOfDay? result =
//         await showTimePicker(context: context, initialTime: TimeOfDay.now());
//     if (result != null) {
//       setState(() {
//         _selectedTime = result.format(context);
//       });
//     }
//   }

//   List<Step> _steps() => [
//         Step(
//           state: currentStep > 0 ? StepState.complete : StepState.indexed,
//           title: Text(
//             'Add Personal Details',
//             style: TextStyle(color: Colors.white60),
//           ),
//           content: PersonalDetails(),
//           isActive: currentStep >= 0,
//         ),
//         Step(
//             state: currentStep > 1 ? StepState.complete : StepState.indexed,
//             title: Text(
//               'Add Doctor',
//               style: TextStyle(color: Colors.white60),
//             ),
//             content: AddDoctorForm(),
//             isActive: currentStep >= 1),
//         Step(
//           state: currentStep > 2 ? StepState.complete : StepState.indexed,
//           title: Text(
//             'Add Medicine',
//             style: TextStyle(color: Colors.white60),
//           ),
//           content: AddMedicineForm(),
//           isActive: currentStep >= 2,
//         ),
//         Step(
//           state: currentStep > 3 ? StepState.complete : StepState.indexed,
//           title: Text(
//             'Add Scheduling',
//             style: TextStyle(color: Colors.white60),
//           ),
//           content: InkWell(
//             onTap: () {
//               _show();
//               print(_selectedTime);
//             },
//             child: Container(
//               margin: EdgeInsets.all(5.sp),
//               child: Text(
//                 _selectedTime != null ? _selectedTime! : 'No time selected!',
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//           ),
//           isActive: currentStep >= 3,
//         )
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Theme(
//         data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(primary: Colors.amber.shade900)),
//         child: Stepper(
//             onStepTapped: (step) {
//               setState(() {
//                 currentStep = step;
//               });
//             },
//             type: StepperType.vertical,
//             currentStep: currentStep,
//             steps: _steps(),
//             onStepContinue: () {
//               final isLast = currentStep == _steps().length - 1;
//               if (isLast) {
//                 Navigator.of(context).pushReplacement(
//                   CustomPageRoute(
//                     child: HomeScreen(),
//                   ),
//                 );
//               } else {
//                 setState(
//                   () {
//                     currentStep += 1;
//                     print('current step index : $currentStep');
//                   },
//                 );
//               }
//             },
//             onStepCancel: currentStep == 0
//                 ? null
//                 : () => setState(() {
//                       currentStep -= 1;
//                     }),
//             controlsBuilder: (context, {onStepContinue, onStepCancel}) {
//               return Container(
//                 margin: EdgeInsets.symmetric(horizontal: 5.w),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: onStepContinue,
//                       child: SepeterButton(
//                         buttonName: 'Next',
//                       ),
//                     ),
//                     SizedBox(
//                       width: 3.w,
//                     ),
//                     InkWell(
//                       onTap: onStepCancel,
//                       child: SepeterButton(
//                         buttonName: 'Cancle',
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }),
//       ),
//     );
//   }
// }

// class SepeterButton extends StatelessWidget {
//   final String? buttonName;
//   const SepeterButton({
//     required this.buttonName,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 7.h,
//       width: 30.w,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         boxShadow: [BoxShadow(offset: Offset(-1, 2))],
//         color: Colors.teal,
//         gradient: LinearGradient(
//             colors: [Colors.orange.shade200, Colors.orange.shade900]),
//         borderRadius: BorderRadius.circular(15.sp),
//       ),
//       child: Text(
//         '$buttonName',
//         style: TextStyle(
//             color: Colors.black54,
//             fontWeight: FontWeight.bold,
//             fontSize: 14.sp),
//       ),
//     );
//   }
// }

// class AddMedicineForm extends StatelessWidget {
//   const AddMedicineForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Medicine Name ',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Pills Per Day',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Total Pills',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class AddDoctorForm extends StatelessWidget {
//   const AddDoctorForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Doctor Name',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'City',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Speciality',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Hospital Name',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PersonalDetails extends StatelessWidget {
//   const PersonalDetails({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Name',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'City',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Disease',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(12.sp),
//           child: TextField(
//             decoration: InputDecoration(
//                 hintText: 'Age',
//                 labelStyle: TextStyle(color: Colors.amber.shade900),
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.amber.shade900),
//                     borderRadius: BorderRadius.circular(20.sp)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blue),
//                     borderRadius: BorderRadius.circular(20.sp))),
//           ),
//         ),
//       ],
//     );
//   }
// }
