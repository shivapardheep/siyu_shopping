import 'package:cloud_firestore/cloud_firestore.dart';

import '../pages/classes/shirtClass.dart';

class DressDatas {
  // DressDatas instance = DressDatas();

  fetchDatabase() async {
    List<ShirtClass> instanceList = [];

    FirebaseFirestore.instance
        .collection('dress')
        .doc('shirt')
        .collection("checked shirt")
        .get()
        .then((value) {
      for (var element in value.docs) {
        Map<String, dynamic> data = element.data();
        ShirtClass instance = ShirtClass.fromJson(data);
        // print("master data : ${instance.colors}");
        instanceList.add(instance);
      }
    });
    return instanceList;
  }
}
