class AddMedicineModel {
  String? tabletName;
  int? totalTablet;
  String? time;
  String? doctorName;

  AddMedicineModel(
      {this.tabletName, this.totalTablet, this.doctorName, this.time});

  AddMedicineModel.fromJson(Map<String, dynamic> json) {
    tabletName = json['tabletName'];
    totalTablet = json['totalTablet'];
    time = json['time'];
    doctorName = json['doctorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabletName'] = this.tabletName;
    data['totalTablet'] = this.totalTablet;
    data['time '] = this.time;
    data['doctorName'] = this.doctorName;

    return data;
  }
}
