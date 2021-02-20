import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS Hà Nội"),
      ),
      body: Center(
        child: Text(
          "Vui lòng liên hệ qua số điện thoại 0964 483 842 hoặc qua email CuuHoHaNoi@soshanoi-44919.firebaseapp.com để được hỗ trợ.",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}