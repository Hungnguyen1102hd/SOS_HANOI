import 'package:flutter/material.dart';

class Discount extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS Hà Nội"),
      ),
      body: Center(
        child: Text(
          "Hiện tại SOS Hà Nội chưa hỗ trợ mã giảm giá cho các dịch vụ.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}