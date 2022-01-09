abstract class LoginEvent {}

class PatientLoginEvent extends LoginEvent {
  String email;
  String password;

  PatientLoginEvent({required this.email, required this.password});
}

class DoctorLoginEvent extends LoginEvent {
  String email;
  String password;
  DoctorLoginEvent({required this.email, required this.password});
}
