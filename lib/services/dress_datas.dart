import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../pages/classes/shirtClass.dart';

class DressDatas {
  static DressDatas instance = DressDatas();

  Future<List<ShirtClass>> fetchDatabase() async {
    // List<ShirtClass> instanceList = [];
    final instanceList = <ShirtClass>[].obs;

    await FirebaseFirestore.instance
        .collection('dress')
        .doc('shirt')
        .collection("checked shirt")
        .get()
        .then((value) {
      for (var element in value.docs) {
        // print("element : ${element.data()}");
        Map<String, dynamic> data = element.data();
        ShirtClass instance = ShirtClass.fromJson(data);
        instanceList.add(instance);
      }
    });
    return instanceList;
  }
}
