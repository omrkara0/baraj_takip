import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../services/getData.dart';
import '../view/detailPage.dart';
import 'buildText.dart';
import 'imagesList.dart';

class ListData extends StatelessWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myController.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(myController.list[index].names),
                buildText(index),
                IconButton(
                  onPressed: () {
                    Get.to(
                        () => DetailPage(
                              name: myController.list[index].names,
                              kapasite: myController.list[index].capasity,
                              oran: myController.list[index].oran,
                              image: resimler[index],
                            ),
                        transition: Transition.rightToLeft);
                  },
                  icon: Icon(Icons.keyboard_arrow_right_sharp),
                ),
              ],
            ),
          );
        });
  }
}
