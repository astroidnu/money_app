import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/res/color_palette.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  LoginTextField({Key key, @required this.hintText, @required this.isPassword}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorPalette.freshAir
        ),
        child: TextField(
          key: key,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0)
          ),
          obscureText: isPassword,
        ),
      ),
    );
  }
}