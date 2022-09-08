import 'package:flutter/material.dart';
import 'package:siyu_shopping/services/dress_datas.dart';

class RoughFirestore extends StatefulWidget {
  const RoughFirestore({Key? key}) : super(key: key);

  @override
  State<RoughFirestore> createState() => _RoughFirestoreState();
}

class _RoughFirestoreState extends State<RoughFirestore> {
  // DressDatas dressDatas = DressDatas();
  getShirtData() async {
    var shirtDatas = DressDatas().fetchDatabase().then((value) {
      print("==================================: ${value}");
    });
    // print("==================================: ${shirtDatas}");
  }

  @override
  void initState() {
    getShirtData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ListTile(
            title: Text("shirtDatas"),
          ),
        ],
      ),
    );
  }
}
