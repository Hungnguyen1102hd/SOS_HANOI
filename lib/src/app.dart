import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/blocs/auth_bloc.dart';


class MyApp extends InheritedWidget {
  final AuthBloc authBloc;
  final Widget child;
  MyApp(this.authBloc,this.child) : super(child:child);


  static MyApp of(BuildContext context){
    // ignore: deprecated_member_use
    return context.inheritFromWidgetOfExactType(MyApp);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

