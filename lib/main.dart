import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/app.dart';
import 'package:flutter_app_template/core/configuration/firebase_remote_configuration_impl.dart';
import 'package:flutter_app_template/dependency/dependency_module.dart';
import 'package:flutter_app_template/dependency/dependency_provider.dart';
import 'package:flutter_app_template/firebase_options.dart';
import 'package:template_package/template_package.dart';

void main() async {
  LoggerDefault.log.d("app start");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final FirebaseRemoteConfig activatedRemoteConfig =
      await FirebaseRemoteConfigImpl.getActivatedRemoteConfig(FirebaseRemoteConfig.instance);
  RemoteConfiguration remoteConfiguration = FirebaseRemoteConfigImpl(activatedRemoteConfig);
  final dependencyModule = DependencyModule(remoteConfiguration: remoteConfiguration);
  final subModules = dependencyModule.getReadySubModules();
  Widget app = DProvider(subModules, child: App(subModules));
  runApp(app);
}
