/// This class is used in the [EmailVerificationScreen] screen.
library;

// ignore_for_file: must_be_immutable
class LoginModel {
  LoginModel({this.email}) {
    email = email ?? "";
  }

  String? email;
}
