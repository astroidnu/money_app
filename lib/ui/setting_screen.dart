import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/di/injector.dart';
import 'package:money_app_v1/util/push_notification.dart';
import 'package:money_app_v1/util/routes.dart';

class SettingScreen extends StatefulWidget {

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  PushNotification pushNotification;

  @override
  void initState() {
    super.initState();
//    pushNotification = PushNotification(context: context);
    pushNotification = Injector.resolve<PushNotification>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: RaisedButton(
              child: Text("Show Notification"),
              onPressed: () => pushNotification.showOngoingNotification(
                  title: "Hello", body: "Please be kind to me"),
            ),
          )),
    );
  }
}
