import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {

  static Container container;

  static final resolve = container.resolve;

  static void setup(){
    container = Container();
    final injector = _$Injector();
    injector._provideFirebaseAnalytics();
    injector._provideFirebaseObserver();

  }

  // ! Singleton
  @Register.singleton(FirebaseAnalytics)
  void _provideFirebaseAnalytics();

  void _provideFirebaseObserver(){
    container.registerSingleton((c) => FirebaseAnalyticsObserver(analytics: c.resolve<FirebaseAnalytics>()));
  }

}