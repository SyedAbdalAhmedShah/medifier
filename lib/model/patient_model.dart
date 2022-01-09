// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) =>
    PatientModel.fromJson(json.decode(str));

class PatientModel {
  PatientModel({
    this.uid,
    this.country,
    this.patientName,
    this.city,
    this.profileImage,
    this.email,
  });

  String? uid;
  String? country;
  String? patientName;
  String? city;
  String? profileImage;
  String? email;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
        uid: json["uid"],
        country: json["country"],
        patientName: json["patientName"],
        city: json["city"],
        profileImage: json["profileImage"],
        email: json["email"],
      );

  Map<String, dynamic> userBashicInfo() {
    return {
      "uid": this.uid,
      "country": this.country,
      "patientName": this.patientName,
      "city": this.city,
      "profileImage": this.profileImage,
      "email": this.email,
    };
  }
}
