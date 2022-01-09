import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/model/patient_model.dart';

abstract class SingupEvent {}

class UserSingupEvent extends SingupEvent {
  PatientModel patientModel;
  // final String email;
  final String password;
  String imageName;
  String imagePath;
  // final String? profileUrl;

  UserSingupEvent({
    required this.patientModel,
    required this.password,
    required this.imageName,
    required this.imagePath,
  });
}

class DoctorSignupEvent extends SingupEvent {
  DoctorModel doctorModel;
  String email;
  String password;

  DoctorSignupEvent(
      {required this.doctorModel, required this.email, required this.password});
}
