import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:money_app_v1/util/remote_config_default.dart';

class RemoteConfigUtils {
  RemoteConfig _remoteConfig;

  RemoteConfigUtils(this._remoteConfig);

  void setupRemoteConfig() {
    _remoteConfig.setConfigSettings(RemoteConfigSettings(debugMode: true));
    _remoteConfig.setDefaults(remoteConfigDefaultValues);
  }

  Future<void> fetchAndActivated() async {
    try {
      await _remoteConfig.fetch(expiration: const Duration(seconds: 0));
      await _remoteConfig.activateFetched();

    } on FetchThrottledException catch (exception) {
      print(exception);
      
    } catch (exception) {
      print("Unable to fetch remote config");
    }
  }

  bool getBooleanData({String key}){
    return _remoteConfig.getBool(key);
  }

  String getStringData({String key}){
    return _remoteConfig.getString(key);
  }

  double getDoubleData({String key}){
    return _remoteConfig.getDouble(key);
  }

  int getIntData({String key}){
    return _remoteConfig.getInt(key);
  }


}