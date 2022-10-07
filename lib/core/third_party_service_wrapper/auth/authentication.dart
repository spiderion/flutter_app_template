import 'package:firebase_auth/firebase_auth.dart';
import 'package:template_package/template_package.dart';

abstract class Authentication {
  String? getUserUID();

  User? getAuthUser();

  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password});

  Future<UserCredential> signInAnonymous();

  Future<void> verifyPhoneNumber(String phoneNumber, Duration timeOut,
      {required PhoneVerificationCompleted verificationCompleted,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout});

  Future<void> sendPasswordResetEmail({required String email});

  Future<void> updatePhoneNumber(PhoneAuthCredential phoneAuthCredential);

  Future<UserCredential> signInWithCredential(AuthCredential credential);

  signOut();

  fetchSignInMethodsForEmail({required String email});

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required password});

  getUserEmail();

  String? getUserPhoneNumber();

  Future<void> updateEmail(RequestObserver<String, dynamic> requestObserver);
}

class AuthenticationImpl extends Authentication {
  final FirebaseAuth _auth;

  AuthenticationImpl(this._auth);

  String? getUserUID() => _auth.currentUser?.uid;

  User? getAuthUser() => _auth.currentUser;

  Future<UserCredential> signInWithEmailAndPassword({required String email, required String password}) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signInAnonymous() async {
    final result = await _auth.signInAnonymously();
    return result;
  }

  Future<void> verifyPhoneNumber(String phoneNumber, Duration timeOut,
      {required PhoneVerificationCompleted verificationCompleted,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: timeOut,
        verificationCompleted: verificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout);
  }

  Future<void> sendPasswordResetEmail({required String email}) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> updatePhoneNumber(PhoneAuthCredential phoneAuthCredential) async {
    await _auth.currentUser?.updatePhoneNumber(phoneAuthCredential);
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }

  signOut() {
    _auth.signOut();
  }

  fetchSignInMethodsForEmail({required String email}) {
    return _auth.fetchSignInMethodsForEmail(email);
  }

  Future<UserCredential> createUserWithEmailAndPassword({required String email, required password}) {
    return _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  getUserEmail() => (_auth.currentUser)?.email;

  String? getUserPhoneNumber() => (_auth.currentUser)?.phoneNumber;

  Future<void> updateEmail(RequestObserver<String, dynamic> requestObserver) async {
    try {
      final userEmail = requestObserver.requestData!;
      await _auth.currentUser!.updateEmail(userEmail);
      final data = await requestObserver.onListen?.call('success');
    } on FirebaseAuthException catch (e) {
      requestObserver.onError?.call(ServerError(message: e.message, code: e.code));
    } catch (e) {
      requestObserver.onError?.call(ServerError(message: e.toString()));
    }
  }
}
