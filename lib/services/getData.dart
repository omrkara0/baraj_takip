import 'package:baraj_takip/controller/mycontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:baraj_takip/model/baraj.dart';

final myController = Get.put(MyController());

var url = Uri.parse(
    "https://www.turkiye.gov.tr/istanbul-su-ve-kanalizasyon-idaresi-baraj-doluluk-oranlari");

Future<List<Baraj>?> getData() async {
  var response = await http.get(url);

  if (response.statusCode == HttpStatus.ok) {
    final body = response.body;
    final document = parser.parse(body);

    var res = document
        .getElementsByClassName("resultTable striped")[0]
        .getElementsByTagName("tbody")[0]
        .getElementsByTagName("tr")
        .forEach((element) {
      myController.list.add(Baraj(
          names: element.children[0].text,
          capasity: element.children[1].text,
          oran: element.children[2].text));
    });
    myController.isLoading.value = false;
    return myController.list;
  }
  return null;
}
