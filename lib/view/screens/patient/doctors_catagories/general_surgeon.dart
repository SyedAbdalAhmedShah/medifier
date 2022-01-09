import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_notifier/Repository/cardiologist_repo.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_bloc.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_speciality_state.dart';
import 'package:medicine_notifier/blocs/doctor_speciality_bloc/doctor_specialty_event.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/view/components/doctor_card.dart';
import 'package:medicine_notifier/view/components/strings.dart';
import 'package:medicine_notifier/view/page_animation/custom_page_route.dart';
import 'package:medicine_notifier/view/screens/patient/doctor_detail_screen.dart';

class GeneralSurgeonScreen extends StatefulWidget {
  @override
  State<GeneralSurgeonScreen> createState() => _GeneralSurgeonScreenState();
}

class _GeneralSurgeonScreenState extends State<GeneralSurgeonScreen> {
  DoctorSpecialityRepository repo = DoctorSpecialityRepository();
  DoctorSpecialityBloc _boc =
      DoctorSpecialityBloc(LoadingDoctorSpecialityState());
  List<DoctorModel> allDoctors = [];
  @override
  void initState() {
    _boc.add(GetDoctorsSpecialityEvent(FirebaseStrings.generalSurgeons));
    repo.getAllCardioDoctors(FirebaseStrings.generalSurgeons);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('General surgeons'),
        ),
        body: BlocConsumer(
            bloc: _boc,
            builder: (contex, event) {
              if (event is LoadingDoctorSpecialityState) {
                return Center(child: CupertinoActivityIndicator());
              }
              if (event is FetchedDoctorSpecialityState) {
                return _buildBody(size, event.doctors);
              }
              return Center(child: CupertinoActivityIndicator());
            },
            listener: (context, state) {
              print("State is $state");
            }));
  }

  Padding _buildBody(Size size, List<DoctorModel> doctors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (_, index) => DoctorCard(
                      ontap: () => Navigator.of(context).push(CustomPageRoute(
                              child: DoctorDetailScreen(
                            doctorModel: doctors[index],
                          ))),
                      doctorName: doctors[index].doctorName!,
                      doctorEmail: doctors[index].email!,
                      doctorSpeciality: doctors[index].speciality!)))
        ],
      ),
    );
  }
}
