import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_notifier/Repository/cardiologist_repo.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_state.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_specialty_event.dart';

class DoctorSpecialityBloc
    extends Bloc<DoctorSpecialityEvent, DoctorSpecialityState> {
  DoctorSpecialityRepository repo = DoctorSpecialityRepository();
  DoctorSpecialityBloc(DoctorSpecialityState initialState)
      : super(initialState) {

    on<GetDoctorsSpecialityEvent>((event, emit) async {
      emit(LoadingDoctorSpecialityState());
      try {
        final doctors = await repo.getAllCardioDoctors(event.specialityName);
        print("doctorssss =====$doctors");
        emit(FetchedDoctorSpecialityState(doctors: doctors));
      } catch (error) {
        emit(FailureDoctorSpecialityState(error: error.toString()));
      }
    });

    on<GetAllDoctorsEvent>((event, emit) async {
      emit(LoadingDoctorSpecialityState());
      try {
        final doctors = await repo.getAllDoctors();
        emit(FetchedDoctorState(doctors: doctors));
      } catch (error) {
        emit(FailureDoctorSpecialityState(error: error.toString()));
      }
    });
  }
}
