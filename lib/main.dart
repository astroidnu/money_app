import 'package:flutter/material.dart';
import 'package:money_app_v1/di/injector.dart';
import 'package:money_app_v1/ui/onboarding_screen.dart';

import 'model/onboarding_data.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final List<OnboardingData> onboardingList = [
    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 1",
        description: "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    ),

    OnboardingData(
        imageResource: "assets/images/icon_otw.png",
        title: "On Boarding 2",
        description: "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    ),

    OnboardingData(
        imageResource: "assets/images/icon_search.png",
        title: "On Boarding 3",
        description: "3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    ),

    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 4",
        description: "4. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coba aja dulu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(onboardingData: onboardingList)
    );
  }
}
