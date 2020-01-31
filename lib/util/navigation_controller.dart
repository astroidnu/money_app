import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_app_v1/model/onboarding_data.dart';
import 'package:money_app_v1/ui/home_screen.dart';
import 'package:money_app_v1/ui/onboarding_screen.dart';

class NavigationController {

  static void navigateToOnBoardingScreen(BuildContext context, {List<OnboardingData> onboardingData}){
    _navigateTo(context, OnboardingScreen(onboardingData: onboardingData));
  }

  static void navigateToHomeScreen(BuildContext context){
    _navigateTo(context, HomeScreen());
  }

  static _navigateTo(BuildContext context, Widget widget){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => widget
    ));
  }
}