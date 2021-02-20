import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/model/option_item.dart';
import 'package:sos_hanoi/src/model/place_item_res.dart';
import 'package:sos_hanoi/src/model/user.dart';
// ignore: must_be_immutable
class WaitingPickup extends StatelessWidget {
  PlaceItemRes placeItemRes;
  OptionItem optionItem;
  UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS Hà Nội"),
      ),
      body: Center(
        child: Text(
          "Hệ thống đang xử lý vui lòng chờ",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
