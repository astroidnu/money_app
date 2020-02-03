import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:kiwi/kiwi.dart';
import 'package:money_app_v1/util/remote_config_utils.dart';

part 'injector.g.dart';

abstract class Injector {

  static Container container;

  static final resolve = container.resolve;

  static Future<void> setup() async {
    container = Container();
    final injector = _$Injector();
    injector._provideFirebaseAnalytics();
    injector._provideFirebaseObserver();
    await injector._provideRemoteConfig();
    injector._provideRemoteConfigUtils();
  }

  // ! Singleton
  @Register.singleton(FirebaseAnalytics)
  void _provideFirebaseAnalytics();

  void _provideFirebaseObserver(){
    container.registerSingleton((c) => FirebaseAnalyticsObserver(analytics: c.resolve<FirebaseAnalytics>()));
  }

  Future<void> _provideRemoteConfig() async {
    final instance = await RemoteConfig.instance;
    container.registerSingleton((c) => instance);
  }

  void _provideRemoteConfigUtils(){
    container.registerSingleton((c) => RemoteConfigUtils(c.resolve<RemoteConfig>()));
  }

}