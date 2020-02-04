import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';
import 'package:money_app_v1/res/login_text_field.dart';
import 'package:money_app_v1/util/navigation_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
            SizedBox(
              height: 20,
            ),
            LoginTextField(
              key: Key('tfPassword'),
              hintText: "Password",
              isPassword: true,
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              color: ColorPalette.richMaroon,
              key: Key('btnSubmit'),
              onPressed: () {
                NavigationController.navigateToHomeScreen(context);
              },
              child: Text("Submit", style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
