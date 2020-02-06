import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_event.dart';
import 'package:money_app_v1/res/color_palette.dart';
import 'package:money_app_v1/res/custom_bottom_navigation.dart';
import 'package:money_app_v1/ui/province_list_screen.dart';
import 'package:money_app_v1/ui/report_screen.dart';
import 'package:money_app_v1/ui/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreenBasedOnNavigationIndex(_selectedIndex),
      bottomNavigationBar: CustomBottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: _onBottomNavItemTapped,
      ),
    );
  }

  void _onBottomNavItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildScreenBasedOnNavigationIndex(int index){
    switch(index){
      case 0: {
        return ProvinceListScreen();
      }
      break;

      case 2: {
        return ReportScreen();
      }

      default: {
        return SettingScreen();
      }
      break;
    }
  }
}
