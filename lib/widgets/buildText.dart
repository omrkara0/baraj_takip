import 'package:baraj_takip/services/getData.dart';
import 'package:flutter/material.dart';

Text buildText(int index) {
  if (double.parse(myController.list[index].oran) > 80) {
    return Text(
      "%" + myController.list[index].oran,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.green),
    );
  } else if (double.parse(myController.list[index].oran) >= 70) {
    return Text("%" + myController.list[index].oran,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          color: Colors.yellow[900],
        ));
  }
  return Text("%" + myController.list[index].oran,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: Colors.red,
      ));
}
