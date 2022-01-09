import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:medicine_notifier/controller/add_medicine_controller.dart';
import 'package:medicine_notifier/model/add_medicine.dart';
import 'package:medicine_notifier/view/components/colors_constant.dart';
import 'package:medicine_notifier/view/components/custom_drawer.dart';

import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:sizer/sizer.dart';

import 'add_medicine_sceen.dart';

class MedicineScreen extends StatefulWidget {
  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final controller = Get.put(MedicineController());

  // @override
  // void initState() {
  //   initialized();
  //   tz.initializeTimeZones();
  //   super.initState();
  // }

  // Future<void> showNotification() async {
  //   localNotificationsPlugin.periodicallyShow(
  //     0,
  //     'abdal shah',
  //     'this is the local notification , to notify you ',
  //     RepeatInterval.everyMinute,
  //     NotificationDetails(
  //         android: AndroidNotificationDetails(
  //             'channel Id', 'channel Name', 'channel  Description')),
  //     payload: 'Panadol',
  //     // uiLocalNotificationDateInterpretation:
  //     //     UILocalNotificationDateInterpretation.absoluteTime,
  //     androidAllowWhileIdle: true,
  //   );
  // }

  // void initialized() async {
  //   var initializedAndroid = AndroidInitializationSettings('ic_launcher');
  //   var initializedSettings =
  //       InitializationSettings(android: initializedAndroid);
  //   await localNotificationsPlugin.initialize(initializedSettings);
  // }

  // static tz.TZDateTime _scheduleDaily(Time time) {
  //   final now = tz.TZDateTime.now(tz.local);
  //   final scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
  //       time.hour, time.minute, time.second);
  //   return scheduledDate.isBefore(now)
  //       ? scheduledDate.add(Duration(seconds: 2))
  //       : scheduledDate;
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
            onRefresh: () {
              //refresh The List of the medicines
              return Future(() => controller.getAllRecord());
            },
            child: Obx(
              () => controller.medicines.isEmpty
                  ? Center(child: Text('No Medicine is Added'))
                  : ListView.builder(
                      itemCount: controller.medicines.length,
                      itemBuilder: (ctx, index) => Container(
                            padding: EdgeInsets.all(10.sp),
                            height: 15.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white24,
                                      offset: Offset(0, 2),
                                      blurRadius: 1)
                                ],
                                border: Border.all(color: Colors.white38),
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(4.sp)),
                            margin: EdgeInsets.all(10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Tablet Name : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      controller.medicines[index].tabletName!,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Tablet Left : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(controller
                                        .medicines[index].totalTablet!
                                        .toString()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Time : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      '${controller.medicines[index].time}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
            )),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: kPrimaryColor,
            onPressed: () {
              print('add medicine button');
              // Fluttertoast.showToast(
              //     msg: 'this is the add medicine button',
              //     gravity: ToastGravity.TOP);

              // showNotification();
              showModalBottomSheet(
                  enableDrag: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(12)),
                  isScrollControlled: true,
                  barrierColor: Colors.grey.withOpacity(0.3),
                  context: context,
                  builder: (context) => AddMedicinePage());
              // Navigator.of(context).push(
              //   CustomPageRoute(
              //     child: AddMedicinePage(),
              //   ),
              // );
            },
            icon: Icon(
              Icons.medical_services_outlined,
              color: Colors.white70,
            ),
            label: Text(
              'Add Medicine',
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
