import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_app_v1/util/local_notification_helper.dart';
import 'package:money_app_v1/util/routes.dart';

class LocalNotificationWidget extends StatefulWidget {
  @override
  _LocalNotificationWidgetState createState() =>
      _LocalNotificationWidgetState();
}

class _LocalNotificationWidgetState extends State<LocalNotificationWidget> {
  final notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final settingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));

    notifications.initialize(
        InitializationSettings(settingsAndroid, settingsIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async =>
      await Navigator.pushNamed(context, WalletRoute, arguments: payload);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          title("Basics"),
          RaisedButton(
            child: Text("Show Notification"),
            onPressed: () => showOngoingNotification(notifications, title: "Title", body: "Body"),
          ),
        ],
      ),
    );
  }

  Widget title(String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      ),
    );
  }
}
