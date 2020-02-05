import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_bloc.dart';
import 'package:money_app_v1/di/injector.dart';
import 'package:money_app_v1/ui/home_screen.dart';
import 'package:money_app_v1/ui/onboarding_screen.dart';
import 'package:money_app_v1/util/app_constants.dart';
import 'package:money_app_v1/util/remote_config_utils.dart';

import 'model/onboarding_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup();
  runApp(BlocProvider(
    child: MyApp(),
    create: (context) => Injector.resolve<ProvinceBloc>(),
  ));
}

class MyApp extends StatelessWidget {
  final RemoteConfigUtils remoteConfigUtils =
      Injector.resolve<RemoteConfigUtils>();

  final List<OnboardingData> onboardingList = [
    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 1",
        description:
            "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_otw.png",
        title: "On Boarding 2",
        description:
            "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_search.png",
        title: "On Boarding 3",
        description:
            "3. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
    OnboardingData(
        imageResource: "assets/images/icon_hamburger.png",
        title: "On Boarding 4",
        description:
            "4. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Coba aja dulu',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder<void>(
          future: setupRemoteConfig(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                  body: Container(
                color: Colors.pink,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
            }
            return remoteConfigUtils.getBooleanData(
                    key: AppConstants.TAG_IS_SHOW_ONBOARDING)
                ? OnboardingScreen(
                    onboardingData: onboardingList,
                  )
                : HomeScreen();
          },
        ));
  }

  Future<void> setupRemoteConfig() async {
    remoteConfigUtils.setupRemoteConfig();
    await remoteConfigUtils.fetchAndActivated();
  }
}
