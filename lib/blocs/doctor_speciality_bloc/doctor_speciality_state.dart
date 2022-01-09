import 'package:medicine_notifier/model/doctor_model.dart';

abstract class DoctorSpecialityState {}

class InitialDoctorSpecialityState extends DoctorSpecialityState {}

class LoadingDoctorSpecialityState extends DoctorSpecialityState {}

class FetchedDoctorSpecialityState extends DoctorSpecialityState {
  List<DoctorModel> doctors = [];
  FetchedDoctorSpecialityState({required this.doctors});
}

class FetchedDoctorState extends DoctorSpecialityState {
  List<DoctorModel> doctors = [];
  FetchedDoctorState({required this.doctors});
}

class FailureDoctorSpecialityState extends DoctorSpecialityState {
  String error;
  FailureDoctorSpecialityState({required this.error});
}
