import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';
import 'package:money_app_v1/res/common_drop_down.dart';
import 'package:money_app_v1/res/login_text_field.dart';
import 'package:money_app_v1/util/navigation_controller.dart';
import 'package:money_app_v1/util/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _dropdownValue;

  List<String> _dropDownItems = [
    'SD',
    'SMP',
    'SMA',
    'D3',
    'D4/S1',
    'S2',
    'S3',
    'Other'
  ];

  TextEditingController _teUsernameController = TextEditingController();
  TextEditingController _tePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Login dulu bro"),
        backgroundColor: ColorPalette.freshAir,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[ColorPalette.freshAir, ColorPalette.bubbles]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginTextField(
              key: Key('tfUsername'),
              hintText: "Username",
              isPassword: false,
              textEditingController: _teUsernameController,
            ),
            SizedBox(
              height: 20,
            ),
            LoginTextField(
              key: Key('tfPassword'),
              hintText: "Password",
              isPassword: true,
              textEditingController: _tePasswordController,
            ),
            SizedBox(
              height: 20,
            ),
            CommonDropdown(
              key: Key('ddEducation'),
              value: _dropdownValue,
              dropdownItems: _dropDownItems,
              onChange: (String selectedValue) {
                setState(() {
                  _dropdownValue = selectedValue;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: ColorPalette.richMaroon,
              key: Key('btnSubmit'),
              onPressed: () {
                if (_teUsernameController.text.isEmpty) {
                  _showSnackBar("Username cannot be empty");
                } else if (_teUsernameController.text.isEmpty) {
                  _showSnackBar("Password cannot be empty");
                } else if (_teUsernameController.text == "azuka" &&
                    _tePasswordController.text == "azuka") {
                  Navigator.pushReplacementNamed(context, HomeRoute);
                } else {
                  _showSnackBar("Username & Password = 'azuka");
                }
              },
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
