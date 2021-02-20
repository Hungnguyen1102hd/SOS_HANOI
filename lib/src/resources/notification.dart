import 'package:flutter/material.dart';
class ShowNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS Hà Nội"),
      ),
      body: Center(
        child: Text(
          "Hiện chưa có thông báo nào từ SOS Hà Nội",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}