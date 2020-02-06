import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_app_v1/main.dart';
import 'package:money_app_v1/ui/home_screen.dart';
import 'package:money_app_v1/ui/login_screen.dart';
import 'package:money_app_v1/ui/onboarding_screen.dart';
import 'package:money_app_v1/ui/province_list_screen.dart';
import 'package:money_app_v1/ui/report_screen.dart';
import 'package:money_app_v1/ui/setting_screen.dart';
import 'package:money_app_v1/ui/wallet_screen.dart';

const String OnboardingRoute = "/";
const String LoginRoute = "/login";
const String HomeRoute = "/home";
const String ProvinceListRoute = "/home/province-list";
const String ReportRoute = "/home/report";
const String SettingRoute = "/home/setting";
const String WalletRoute = "/home/wallet";


class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case OnboardingRoute: return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case LoginRoute: return MaterialPageRoute(builder: (_) => LoginScreen());
      case HomeRoute: return MaterialPageRoute(builder: (_) => HomeScreen());
      case ProvinceListRoute: return MaterialPageRoute(builder: (_) => ProvinceListScreen());
      case ReportRoute: return MaterialPageRoute(builder: (_) => ReportScreen());
      case SettingRoute: return MaterialPageRoute(builder: (_) => SettingScreen());
      case WalletRoute: return MaterialPageRoute(builder: (_) => WalletScreen(payload: routeSettings.arguments,));
      default: return MaterialPageRoute(builder: (_) => MyApp());
    }
  }
}