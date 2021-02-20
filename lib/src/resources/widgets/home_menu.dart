import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/app.dart';
import 'package:sos_hanoi/src/resources/discount.dart';
import 'package:sos_hanoi/src/resources/history.dart';
import 'package:sos_hanoi/src/resources/login_page.dart';
import 'package:sos_hanoi/src/resources/notification.dart';
import 'package:sos_hanoi/src/resources/support.dart';
import 'package:sos_hanoi/src/resources/widgets/profile_user.dart';

class HomeMenu extends StatefulWidget {
  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Image.asset("ic_menu_user.png"),
          title: RaisedButton(
            onPressed: _showProfile,
            child: Text(
              "Hồ sơ của bạn",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_history.png"),
          title: RaisedButton(
            onPressed: _showHistory,
            child: Text(
              "Lịch sử",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_percent.png"),
          title: RaisedButton(
            onPressed: _showDiscount,
            child: Text(
              "Khuyến mãi",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_notify.png"),
          title: RaisedButton(
            onPressed: _showNotifications,
            child: Text(
              "Thông báo",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_help.png"),
          title: RaisedButton(
            onPressed: _onHelp,
            child: Text(
              "Hỗ trợ",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        ),
        ListTile(
          leading: Image.asset("ic_menu_logout.png"),
          title: RaisedButton(
            onPressed: _onSignOut,
            child: Text(
              "Đăng xuất",
              style: TextStyle(fontSize: 18, color: Color(0xff323643)),
            ),
          ),
        )
      ],
    );
  }

  void _onSignOut() {
    var authBloc = MyApp.of(context).authBloc;
    authBloc.signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }

  void _showProfile() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileUser()));
  }

  void _showHistory() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => History()));
  }

  void _showDiscount() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Discount()));
  }

  void _showNotifications() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowNotification()));
  }

  void _onHelp() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Support()));
  }
}
