import 'package:medicine_notifier/model/patient_model.dart';

class UserManager {
  UserManager._privateConstructor();

  static PatientModel user = PatientModel();
  static late bool isUserLogedIn;
  static final UserManager _instance = UserManager._privateConstructor();

  factory UserManager() {
    return _instance;
  }
}
