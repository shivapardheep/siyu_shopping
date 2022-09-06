import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  CollectionReference users = FirebaseFirestore.instance.collection('dress');

  fetchData() {
    print("called");

    FutureBuilder<DocumentSnapshot>(
      future: users.doc("shirt").get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          print("error");
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          print("error");

          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print("--------------------------");
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
