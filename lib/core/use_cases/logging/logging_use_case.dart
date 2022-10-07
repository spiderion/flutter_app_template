import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_template/core/repositories/logging_repository/logging_repository_impl.dart';
import 'package:flutter_app_template/dependency/sub_modules/value_notifier_sub_module.dart';
import 'package:template_package/template_package.dart';

class LoggingUseCase extends UseCase<LoggingRepository> {
  final ValueNotifierSubModule? _valueNotifierSubModule;

  final BaseAnalytics _analytics;

  LoggingUseCase(
    LoggingRepository repository,
    this._valueNotifierSubModule,
    this._analytics,
  ) : super(repository);

  Future<void> verifyPhoneNumber(String phoneNumber, Duration timeOut,
      {required PhoneVerificationCompleted verificationCompleted,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout}) async {
    await repository.verifyPhoneNumber(phoneNumber, timeOut,
        phoneCodeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
        phoneVerificationFailed: phoneVerificationFailed,
        phoneCodeSent: phoneCodeSent,
        verificationCompleted: verificationCompleted);
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await repository.signInWithCredential(credential);
  }

  Future signOutUser(RequestObserver requestObserver) async {
    _analytics.dispose();
    //_valueNotifierSubModule?.userProfileDataNotifier.clearData();
    //_pushNotificationManager.deleteInstanceId();
    //await _defaultCacheManager!.emptyCache();
    //_valueNotifierSubModule?.localNotificationNotifier.clearData();
    repository.signOutUser(requestObserver);
  }

  bool checkCanSkipConfigEnabled() {
    return repository.checkCanSkipConfigEnabled();
  }
}
