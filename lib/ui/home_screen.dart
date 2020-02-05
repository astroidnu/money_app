import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_event.dart';
import 'package:money_app_v1/res/color_palette.dart';
import 'package:money_app_v1/ui/custom_bottom_navigation.dart';
import 'package:money_app_v1/ui/province_list_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProvinceListScreen(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
