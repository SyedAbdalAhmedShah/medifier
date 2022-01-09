import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicine_notifier/model/doctor_model.dart';

class DoctorSpecialityRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<List<DoctorModel>> getAllCardioDoctors(String catagoryName) async {
    Query<Map<String, dynamic>> cardioDoctors = await firestore
        .collection('Doctors')
        .where("speciality", isEqualTo: catagoryName);
    final doctors = await cardioDoctors.get();
    final instanceOfDoc =
        doctors.docs.map((e) => DoctorModel.fromJson(e.data())).toList();

    print('cardiologists =====${instanceOfDoc}');
    print('cardiologist =====${instanceOfDoc.length}');
    return instanceOfDoc;
  }

  Future<List<DoctorModel>> getAllDoctors() async {
    Query<Map<String, dynamic>> cardioDoctors =
        await firestore.collection('Doctors');
    final doctors = await cardioDoctors.get();
    final instanceOfDoc =
        doctors.docs.map((e) => DoctorModel.fromJson(e.data())).toList();

    print('All doctors =====${instanceOfDoc}');
    print('All doctors Length =====${instanceOfDoc.length}');
    return instanceOfDoc;
  }
}
