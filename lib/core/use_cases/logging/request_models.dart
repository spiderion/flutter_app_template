import 'package:template_package/template_package.dart';

class RequestSignInWithEmailAndPassword implements RequestModel {
  final String? email;
  final String? password;

  RequestSignInWithEmailAndPassword(this.email, this.password);
}

class RequestSendLinkToResetPassword implements RequestModel {
  final String email;

  RequestSendLinkToResetPassword(this.email);
}

class RequestSignOutUser implements RequestModel {}
