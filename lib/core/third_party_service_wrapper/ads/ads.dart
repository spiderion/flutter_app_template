import 'dart:io';

import 'package:flutter_app_template/core/constants/key_constants.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/ads/abstract_ads.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:template_package/template_package.dart';

class Ads extends AbstractAds {
  InterstitialAd? _interstitialAd;
  final RemoteConfiguration _remoteConfiguration;
  final String testAdd = 'ca-app-pub-3940256099942544/1033173712';
  late String addFromRemoteConfig;

  Ads(this._remoteConfiguration) {
    MobileAds.instance.initialize();
    addFromRemoteConfig = isInDebugMode ? testAdd : getAdFromRemote();
    loadAd();
  }

  String getAdFromRemote() {
    return _remoteConfiguration.getString(Platform.isIOS
        ? ConfigKeyConstants.IOS_INTERSTITIAL_AD_ID
        : ConfigKeyConstants.ANDROID_INTERSTITIAL_AD_ID);
  }

  @override
  Future<void> loadAd({String? addUnitID}) async {
    await InterstitialAd.load(
        adUnitId: addUnitID ?? addFromRemoteConfig,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            this._interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  Future<void> show() async {
    await _interstitialAd?.show();
    await loadAd();
  }
}
