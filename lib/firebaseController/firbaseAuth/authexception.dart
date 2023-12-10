import 'package:serviceprovder/component/utilitiy.dart';

class SignandLoginFailure {
  final String failure;

  const SignandLoginFailure([this.failure = 'An unknown error as occurred']);

  factory SignandLoginFailure.code(String code) {
    String errorMessage;
    switch (code) {
      case 'weak-password':
        errorMessage = "Please enter a stronger password.";
        break;
      case 'invalid-email':
        errorMessage = "Please enter a valid email.";
        break;
      case 'email-already-in-use':
        errorMessage = "An account already exists for this email.";
        break;
      case 'operation-not-allowed':
        errorMessage = "Operation not allowed, please contact support.";
        break;
      case 'user-disabled':
        errorMessage =
            "This user has been disabled, please contact support for help.";
        break;
      default:
        errorMessage = "An unknown error has occurred.";
        break;
    }
    Utils().onError(errorMessage);
    return SignandLoginFailure(errorMessage);
  }
}
