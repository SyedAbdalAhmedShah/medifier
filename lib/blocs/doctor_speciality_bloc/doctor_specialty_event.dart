abstract class DoctorSpecialityEvent {}

class GetDoctorsSpecialityEvent extends DoctorSpecialityEvent {
  String specialityName;
  GetDoctorsSpecialityEvent(this.specialityName);
}

class GetAllDoctorsEvent extends DoctorSpecialityEvent {}
