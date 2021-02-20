import 'package:flutter/material.dart';

class ResetPassWord extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOS Hà Nội"),
      ),
      body: Center(
        child: Text(
          "Vui lòng liên hệ qua email CuuHoHaNoi@soshanoi-44919.firebaseapp.com để được hỗ trợ việc cấp lại password",
          style: TextStyle(fontSize: 16,),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}