import 'package:flutter_app_template/core/constants/key_constants.dart';
import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:template_package/template_package.dart';

class UxCamImpl extends BaseAnalytics {
  final RemoteConfiguration remoteConfiguration;

  UxCamImpl(this.remoteConfiguration) : super();

  @override
  initialize() {
    bool isEnabledByServer = remoteConfiguration.getBool(ConfigKeyConstants.UX_CAM_IS_ENABLED) == true;
    if (isEnabledByServer) {
      isInitialized = true;
      FlutterUxcam.optIntoSchematicRecordings();
      final key = remoteConfiguration.getString(ConfigKeyConstants.UX_CAM_KEY);
      FlutterUxcam.startWithKey(key);
      FlutterUxcam.setAutomaticScreenNameTagging(false);
    }
  }

  @override
  isSensitiveScreen(bool isSensitive, List<Type> sendTo, {Map<String, dynamic> properties = const {}}) {
    FlutterUxcam.occludeSensitiveScreen(isSensitive);
  }

  @override
  logEvent(String name, List<Type>? sendTo, {Map<String, dynamic>? properties = const {}}) {
    if (isInitialized && shouldSendToThisPlatform(sendTo)) {
      FlutterUxcam.logEventWithProperties(name, properties ?? {});
    }
  }

  @override
  logPageName(String pageName, List<Type> sendTo, {Map<String, dynamic> properties = const {}}) {
    if (isInitialized && shouldSendToThisPlatform(sendTo)) {
      FlutterUxcam.tagScreenName(pageName.replaceAll("_", ' '));
    }
  }

  @override
  void identifyUser(String? uid) {
    if (isInitialized && uid?.isNotEmpty == true) {
      FlutterUxcam.setUserIdentity(uid!);
    }
  }

  @override
  void setUserProperties(Map<String, dynamic> properties) {
    properties.forEach((key, value) {
      FlutterUxcam.setUserProperty(key.toString().replaceAll('\$', ''), value.toString());
    });
  }

  @override
  void setUserPropertiesWithOptions(Map<String, dynamic> properties, String analyticOption) {
    ///Maybe Needs to set first the updateOptions
    return;
  }

  @override
  dispose() async {
    await FlutterUxcam.stopSessionAndUploadData();
  }
}
