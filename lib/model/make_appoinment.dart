class MakeAppoinment {
  String? patientUid;
  String? pateintName;
  String? pateintAge;
  String? disease;
  String? description;
  String? time;
  String? date;
  String? doctorUid;

  MakeAppoinment({
    this.patientUid,
    this.pateintName,
    this.pateintAge,
    this.description,
    this.disease,
    this.date,
    this.time,
    this.doctorUid,
  });

  MakeAppoinment.fromJson(Map<String, dynamic> json) {
    pateintName = json['pateintName'];
    pateintAge = json['pateintAge'];
    disease = json['disease'];
    description = json['description'];
    time = json['time'];
    date = json['date'];
    doctorUid = json['doctorUid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pateintName'] = this.pateintName;
    data['pateintAge'] = this.pateintAge;
    data['disease'] = this.disease;
    data['description'] = this.description;
    data['time'] = this.time;
    data['date'] = this.date;
    data['doctorUid'] = this.doctorUid;
    return data;
  }
}
