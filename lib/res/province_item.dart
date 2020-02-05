import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/model/Province.dart';
import 'package:money_app_v1/util/navigation_controller.dart';

class ProvinceItem extends StatelessWidget {

  final Province province;

  ProvinceItem({Key key, @required this.province}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(province.name),
      onTap: () {
        NavigationController.navigateToReportScreen(context);
      },
    );
  }
}