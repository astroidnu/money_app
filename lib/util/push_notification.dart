import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:money_app_v1/util/local_push_notification_configuration.dart';
import 'package:money_app_v1/util/routes.dart';

class PushNotification implements LocalPushNotificationConfiguration{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final BuildContext context;

  PushNotification({this.context}) {
    final settingAndroid = AndroidInitializationSettings("app_icon");
    final settingIOS = IOSInitializationSettings(
//        onDidReceiveLocalNotification: (id, title, body, payload) {}
            /*onSelectNotification(payload)*/);

    _flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(settingAndroid, settingIOS),
        onSelectNotification: onSelectNotification);
  }



  NotificationDetails get _noSound {
    final androidChannelSpecifics = AndroidNotificationDetails(
      'silent_money_app_id',
      'silent_money_app_name',
      'silent_money_app_description',
      playSound: false,
    );
    final iOSChannelSpecifics = IOSNotificationDetails(presentSound: false);

    return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
  }

  Future showSilentNotification({
    int id = 0,
    @required String title,
    @required String body,
    String payload,
  }) {
    return _showNotification(title: title, body: body, id: id, notificationDetails: _noSound, payload: payload);
  }

  NotificationDetails get _ongoing {
    final androidChannelSpecifics = AndroidNotificationDetails(
      'money_app_id',
      'money_app_name',
      'money_app_description',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      color: Colors.pink,
      autoCancel: true,
    );
    final iOSChannelSpecifics = IOSNotificationDetails();
    return NotificationDetails(androidChannelSpecifics, iOSChannelSpecifics);
  }

  Future showOngoingNotification({
    int id = 0,
    @required String title,
    @required String body,
    String payload,
  }) {
    return _showNotification(title: title, body: body, id: id, notificationDetails: _ongoing, payload: payload);
  }

  Future _showNotification({
    @required String title,
    @required String body,
    @required NotificationDetails notificationDetails,
    int id = 0,
    String payload,
  }) {
    return _flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: payload);
  }

  @override
  Future onSelectNotification(String payload) async {
    if (context != null){
      return await Navigator.pushNamed(context, WalletRoute, arguments: payload);
    }
    return null;
  }
}
