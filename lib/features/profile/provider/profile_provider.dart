import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileModel _profileModel = ProfileModel();

  ProfileModel get profileModel => _profileModel;

  void initialize() {
    _profileModel = ProfileModel(
      name: '(Name)',
      email: '(Email address)',
      role: '(Role)',
    );
  }

  void onEditProfile() {
    // Handle edit profile functionality
    print('Edit profile clicked');
  }

  void onLogout() {
    // Handle logout functionality
    print('Logout clicked');
  }

  void onHelpSupport() {
    // Navigate to help page
    print('Help & support clicked');
  }

  void onTermsConditions() {
    // Navigate to terms page
    print('Terms & conditions clicked');
  }

  void onNavigateToDashboard() {
    // Navigate to dashboard
    print('Navigate to dashboard');
  }

  void onNavigateToReportList() {
    // Navigate to report list
    print('Navigate to report-list');
  }

  void onNavigateToReportMap() {
    // Navigate to report map
    print('Navigate to report-map');
  }

  void onNavigateToAccount() {
    // Navigate to account
    print('Navigate to account');
  }
}
