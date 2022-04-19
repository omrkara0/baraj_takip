import 'package:baraj_takip/model/baraj.dart';
import 'package:baraj_takip/services/getData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mycontroller.dart';

class DetailPage extends StatelessWidget {
  String name;
  String kapasite;
  String oran;
  String image;
  DetailPage(
      {Key? key,
      required this.name,
      required this.kapasite,
      required this.oran,
      required this.image})
      : super(key: key);

  final myController = Get.put(MyController());

  TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle style2 = TextStyle(fontSize: 20, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    var kullanilan_alan =
        ((double.parse(kapasite) * double.parse(oran)) / 100).toInt();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(image, loadingBuilder:
                    (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }),
                borderRadius: BorderRadius.circular(15),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Doluluk oranı :",
                          style: style,
                        ),
                        Text(
                          "%" + " " + oran,
                          style: style2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kapasite :",
                          style: style,
                        ),
                        Text(
                          kapasite + " " + "m3",
                          style: style2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kalan Alan :",
                          style: style,
                        ),
                        Text(
                          ((double.parse(kapasite) - kullanilan_alan).toInt())
                                  .toString() +
                              " " +
                              "m3",
                          style: style2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dolu Alan :",
                          style: style,
                        ),
                        Text(
                          kullanilan_alan.toString() + " " + "m3",
                          style: style2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
