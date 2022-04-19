import 'package:baraj_takip/services/getData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/baraj.dart';

class MyController extends GetxController {
  var isLoading = true.obs;
  List<Baraj> list = <Baraj>[].obs;
  Future<List<Baraj>?>? data;

  @override
  void onInit() {
    // TODO: implement onInit
    data = getData();
    super.onInit();
  }
}
