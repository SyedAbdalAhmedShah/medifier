import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicine_notifier/blocs/make_appoinment_bloc/make_appoinment_state.dart';
import 'package:medicine_notifier/model/doctor_model.dart';
import 'package:medicine_notifier/model/make_appoinment.dart';
import 'package:medicine_notifier/model/patient_model.dart';
import 'package:medicine_notifier/view/components/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future storePatientInformation(PatientModel patientModel, String uid) async {
    final patientDetails = Map<String, Object>();
    patientDetails['city'] = patientModel.city!;
    patientDetails['country'] = patientModel.country!;
    patientDetails['email'] = patientModel.email!;
    patientDetails['profileImage'] = patientModel.profileImage!;
    patientDetails['patientName'] = patientModel.patientName!;
    patientDetails['uid'] = patientModel.uid!;

    firestore
        .collection(FirebaseStrings.patientCollection)
        .doc(uid)
        .set(patientDetails);
  }

  Future storeDoctorInformation(
    DoctorModel doctor,
    String uid,
  ) async {
    final doctorDetail = Map<String, Object>();

    doctorDetail['doctorName'] = doctor.doctorName!;
    doctorDetail['clinicName'] = doctor.clinicName!;
    doctorDetail['email'] = doctor.email!;
    doctorDetail['speciality'] = doctor.speciality!;
    doctorDetail['uid'] = doctor.uid!;

    final userCredential = await firestore
        .collection(FirebaseStrings.doctorsCollection)
        .doc(uid)
        .set(doctorDetail);

    print('inserteddd ');

    return userCredential;
  }

  Future logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    auth.signOut();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getPatientAfterLogin(
      String uid) async {
    DocumentSnapshot<Map<String, dynamic>> patient = await firestore
        .collection(FirebaseStrings.patientCollection)
        .doc(uid)
        .get();
    return patient;
  }

  makeAppoinment(
      {required Map<String, dynamic> data, required String uid}) async {
    await firestore
        .collection(FirebaseStrings.appoinments)
        .doc(uid)
        .set(data)
        .catchError((error) {
      print('firebase error in aapi $error');
    }).whenComplete(() => print('appoinment inserted'));
  }
}
