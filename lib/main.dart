import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_app_v1/bloc/province_bloc/province_bloc.dart';
import 'package:money_app_v1/di/injector.dart';
import 'package:money_app_v1/ui/home_screen.dart';
import 'package:money_app_v1/ui/onboarding_screen.dart';
import 'package:money_app_v1/util/app_constants.dart';
import 'package:money_app_v1/util/push_notification.dart';
import 'package:money_app_v1/util/remote_config_utils.dart';
import 'package:money_app_v1/util/routes.dart';

import 'model/onboarding_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup();
  runApp(BlocProvider(
    child: MyApp(),
    create: (context) => Injector.resolve<ProvinceBloc>(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RemoteConfigUtils remoteConfigUtils =
      Injector.resolve<RemoteConfigUtils>();

  PushNotification pushNotification;

  @override
  void initState() {
    super.initState();

    pushNotification = PushNotification(/*context: context*/);
    Injector.container.registerInstance(pushNotification);
  }

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
                ? OnboardingScreen()
                : HomeScreen();
          },
        ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: OnboardingRoute,
    );
  }

  Future<void> setupRemoteConfig() async {
    remoteConfigUtils.setupRemoteConfig();
    await remoteConfigUtils.fetchAndActivated();
  }
}
