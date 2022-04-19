import 'package:baraj_takip/model/baraj.dart';
import 'package:baraj_takip/services/getData.dart';
import 'package:baraj_takip/widgets/imagesList.dart';
import 'package:baraj_takip/widgets/listData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mycontroller.dart';
import '../widgets/buildText.dart';
import 'detailPage.dart';

class HomePage extends StatelessWidget {
  final myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İstanbul Baraj Doluluk Oranları"),
      ),
      body: FutureBuilder<List<Baraj>?>(
        future: myController.data,
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text('Error'));
            } else if (snapshot.hasData) {
              return ListData();
            } else {
              return Center(
                  child: const Text('Empty data , please control server.'));
            }
          } else {
            return Center(child: Text('State: ${snapshot.connectionState}'));
          }
        },
      ),
    );
  }
}
