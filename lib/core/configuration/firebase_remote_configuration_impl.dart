import 'dart:async';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:template_package/template_package.dart';

class FirebaseRemoteConfigImpl implements RemoteConfiguration {
  FirebaseRemoteConfig remoteConfig;

  FirebaseRemoteConfigImpl(this.remoteConfig);

  static Future<FirebaseRemoteConfig> getActivatedRemoteConfig(FirebaseRemoteConfig config) async {
    await config.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));
    try {
      await config.fetchAndActivate();
      return config;
    } catch (e) {
      LoggerDefault.log.e(e);
      return config;
    }
  }

  @override
  String getString(String key) {
    return remoteConfig.getString(key);
  }

  @override
  bool getBool(String key) {
    return remoteConfig.getBool(key);
  }

  @override
  Future<bool> fetchLatest() async {
    return await remoteConfig.fetchAndActivate();
  }

  @override
  double getDouble(String key) {
    return remoteConfig.getDouble(key);
  }

  @override
  int getInt(String key) {
    return remoteConfig.getInt(key);
  }
}
