import 'package:medicine_notifier/model/make_appoinment.dart';

abstract class MakeAppoinmentEvent {}

class CreateAppoinmentState extends MakeAppoinmentEvent {
  final Map<String, dynamic> appoinment;
  CreateAppoinmentState({required this.appoinment});
}
