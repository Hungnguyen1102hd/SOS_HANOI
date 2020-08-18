import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/app.dart';
import 'package:sos_hanoi/src/blocs/auth_bloc.dart';
import 'package:sos_hanoi/src/resources/login_page.dart';

void main() {
  runApp(MyApp(new AuthBloc(),MaterialApp(
    home: LoginPage(),
  )));
}