import 'package:flutter/material.dart';
import 'package:sos_hanoi/src/firebase/database_pickup.dart';
import 'package:sos_hanoi/src/model/user.dart';
import 'package:sos_hanoi/src/resources/widgets/avatar.dart';
class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {

  final _newNameController = new TextEditingController();
  final _newPhoneController = new TextEditingController();
  final _newPassController = new TextEditingController();

  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Avatar(
                    //avatarUrl: _currentUser?.avatarUrl,
                    onTap: () {},
                  ),
                  Text(
                      "Hi nice to see you here."),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _newNameController,
                      decoration: InputDecoration(
                          icon: new Icon(Icons.edit),
                          labelText: "Tên người dùng",
                          hintText: "",
                          ),
                      onChanged: (String value) {
                        Database.saveName(value);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: _newPhoneController,
                      decoration: InputDecoration(
                        icon: new Icon(Icons.edit),
                        labelText: "Số điện thoại",
                        hintText: "",
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Manage Password",
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.display1,
                          ),
                          TextFormField(
                            controller: _newPassController,
                            decoration:
                            InputDecoration(hintText: "New Password",icon: new Icon(Icons.edit),),
                          ),
                          TextFormField(
                            decoration:
                            InputDecoration(hintText: "Repeat Password",icon: new Icon(Icons.edit),),
                          )
                        ],
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        _saveAll();
                        // TODO: Save somehow
                        Navigator.pop(context);
                      },
                      child: Text("Save Profile"),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  void _saveAll() {
  }
}

