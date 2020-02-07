import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class LocalPushNotificationConfiguration {

  Future onSelectNotification(String payload);



}