import 'package:flutter/material.dart';

import '../models/login_model.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel loginModel = LoginModel();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void initialize() {
    emailController.clear();
    isLoading = false;
  }

  void onEmailChanged(String value) {
    loginModel.email = value;
  }

  void onSendLoginLink() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      // Show error message for empty email
      return;
    }

    if (!_isValidEmail(email)) {
      // Show error message for invalid email
      return;
    }

    isLoading = true;
    notifyListeners();

    // Simulate API call
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
      // Handle successful login link sent
    });
  }

  void onTermsClick() {
    // Handle terms and conditions navigation
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex
        .hasMatch(email); // Modified: Changed 'test' to 'hasMatch' for RegExp
  }
}
