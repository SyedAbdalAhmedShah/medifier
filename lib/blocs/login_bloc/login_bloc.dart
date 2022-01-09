import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_notifier/Repository/api_helper.dart';
import 'package:medicine_notifier/blocs/login_bloc/login_event.dart';
import 'package:medicine_notifier/blocs/login_bloc/login_state.dart';
import 'package:medicine_notifier/model/patient_model.dart';
import 'package:medicine_notifier/view/components/strings.dart';
import 'package:medicine_notifier/view/components/user_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState());

  FirebaseAuth auth = FirebaseAuth.instance;
  ApiHelper apiHelper = ApiHelper();

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is PatientLoginEvent) {
      yield LoginLoadingState();

      try {
        UserCredential loginCredential = await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        print('login credential ========= ${loginCredential.user}');

        final userFound = await patientExsist(loginCredential);

        print(userFound.length);
        if (userFound.length >= 1) {
          final patient =
              await apiHelper.getPatientAfterLogin(userFound.first.id);
          final singlepatient = PatientModel.fromJson(patient.data()!);
          await saveUserData(patient: singlepatient);

          UserManager.user = singlepatient;
          yield LoginSuccessState();
        } else {
          yield LoginFailureState(error: FirebaseStrings.patientNotExist);
        }
      } catch (error) {
        yield LoginFailureState(error: error.toString());
        print(
            'in login bloc catch error ================= ${error.toString()}');
      }
    }

    if (event is DoctorLoginEvent) {
      yield LoginLoadingState();
      try {
        UserCredential doctorCredential = await auth.signInWithEmailAndPassword(
            email: event.email, password: event.password);
        print("doctor login Credentials ======= $doctorCredential ");

        final doctorFound = await doctorExsist(doctorCredential);
        if (doctorFound.length >= 1) {
          yield LoginSuccessState();
        } else {
          yield LoginFailureState(error: FirebaseStrings.dotctorNotExist);
        }
      } catch (error) {
        yield LoginFailureState(error: error.toString());
        print(
            'in login bloc catch error ================= ${error.toString()}');
      }
    }
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> patientExsist(
      UserCredential credential) async {
    final dataFromFirebase =
        await FirebaseFirestore.instance.collection('Patients').get();

    final userFound = dataFromFirebase.docs
        .where((firebaseuser) => firebaseuser.id.contains(credential.user!.uid))
        .toList();
    // final data =
    //     docData.docs.contains(user.currentUser!.uid);
    print('aaaaaa ${userFound}');

    return userFound;
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> doctorExsist(
      UserCredential credential) async {
    final dataFromFirebase =
        await FirebaseFirestore.instance.collection('Doctors').get();

    final userFound = dataFromFirebase.docs
        .where((firebaseuser) => firebaseuser.id.contains(credential.user!.uid))
        .toList();
    // final data =
    //     docData.docs.contains(user.currentUser!.uid);
    print('aaaaaa ${userFound}');

    return userFound;
  }

  Future saveUserData({required PatientModel patient}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final isLogedIn =
        await sharedPreferences.setBool(FirebaseStrings.isLogedIn, true);
    UserManager.isUserLogedIn = isLogedIn;
    print('isLogedIn $isLogedIn');

    final sharedPred = await sharedPreferences.setString(
        FirebaseStrings.userKey, json.encode(patient.userBashicInfo()));
    print('sharedprefrences $sharedPred');
  }
}
