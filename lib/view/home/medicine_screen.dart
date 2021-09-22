import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicine_notifier/view/add_medicine/add_medicine.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class MedicineScreen extends StatefulWidget {
  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initialized() async {
    var initializedAndroid = AndroidInitializationSettings('ic_launcher');
    var initializedSettings =
        InitializationSettings(android: initializedAndroid);
    await localNotificationsPlugin.initialize(initializedSettings);
  }

  @override
  void initState() {
    initialized();
    tz.initializeTimeZones();
    super.initState();
  }

  Future<void> showNotification() async {
    localNotificationsPlugin.zonedSchedule(
        0,
        'abdal shah',
        'this is the local notification , to notify you ',
        tz.TZDateTime.now(tz.local).add(Duration(seconds: 5)),
        NotificationDetails(
            android: AndroidNotificationDetails(
                'channel Id', 'channel Name', 'channel  Description')),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Add Medicines Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.amber.shade900,
          onPressed: () {
            showNotification();
            // Navigator.of(context).push(
            //   CustomPageRoute(
            //     child: AddMedicinesScreen(),
            //   ),
            // );
          },
          icon: Icon(
            Icons.medical_services_outlined,
            color: Colors.black54,
          ),
          label: Text(
            'Add Medicine',
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          )),
    );
  }
}
