import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/util/local_notification_widget.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LocalNotificationWidget(),
      ),
    );
  }
}