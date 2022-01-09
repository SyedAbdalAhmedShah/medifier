import 'package:get/get.dart';
import 'package:medicine_notifier/local%20database/local_database.dart';
import 'package:medicine_notifier/model/add_medicine.dart';

class MedicineController extends GetxController {
  var medicines = <AddMedicineModel>[].obs;

  @override
  void onInit() {
    getAllRecord();
    super.onInit();
  }

  getAllRecord() async {
    final records = await DbHelper.getAllRecordFromDb();
    print('controller record ======== $records');

    if (records.isEmpty) {
      final data = records.map((e) => AddMedicineModel.fromJson(e)).toList();
      medicines.assignAll(data);
      print('asdasdasdasdasd $data');
    } else {
      print('dataabase is empty');
    }
    print(medicines);
  }
}
