import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_template/core/constants/key_constants.dart';
import 'package:flutter_app_template/core/third_party_service_wrapper/auth/authentication.dart';
import 'package:template_package/template_package.dart';

class LoggingRepository extends BaseRepository {
  final Authentication _authentication;

  LoggingRepository(RemoteConfiguration remoteConfiguration, this._authentication)
      : super(remoteConfiguration);

  Future signOutUser(RequestObserver<dynamic, dynamic> requestObserver) async {
    try {
      await _authentication.signOut();
      requestObserver.onListen?.call('success');
      requestObserver.onDone?.call();
    } catch (e, s) {
      // _crashlyticsManager.recordError(e, s);
      requestObserver.onError?.call(ServerError(message: e.toString()));
    }
  }

  Future<void>? sendPasswordResetEmail(String email) async {
    try {
      await _authentication.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      return null;
    }
  }

  Future<void> verifyPhoneNumber(String phoneNumber, Duration timeOut,
      {required PhoneVerificationCompleted verificationCompleted,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout}) async {
    try {
      await _authentication.verifyPhoneNumber(phoneNumber, timeOut,
          verificationCompleted: verificationCompleted,
          phoneVerificationFailed: phoneVerificationFailed,
          phoneCodeSent: phoneCodeSent,
          phoneCodeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await _authentication.signInWithCredential(credential);
  }

  bool checkCanSkipConfigEnabled() {
    return remoteConfiguration.getBool(ConfigKeyConstants.CAN_SKIP_LOGIN);
  }
}
