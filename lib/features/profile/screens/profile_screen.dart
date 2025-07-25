import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<ProfileProvider>(
      create: (context) => ProfileProvider()..initialize(),
      child: const ProfileScreen(),
    );
  }

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: appTheme.colorFFF3F4,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Profile & settings',
        style: TextStyleHelper.instance.title16Black
            .copyWith(color: appTheme.colorFF1F29),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildBackgroundSection(),
              _buildProfileContent(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBackgroundSection() {
    return Container(
      height: 192.h,
      width: double.infinity,
      color: appTheme.colorFFF3F4,
    );
  }

  Widget _buildProfileContent(ProfileProvider provider) {
    return Transform.translate(
      offset: Offset(0, -144.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            _buildAvatarSection(),
            SizedBox(height: 32.h),
            _buildUserInformation(provider),
            SizedBox(height: 32.h),
            _buildActionButtons(provider),
            SizedBox(height: 48.h),
            _buildSettingsMenu(provider),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteCustom,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: appTheme.blackCustom.withAlpha(26),
            blurRadius: 8.h,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.h),
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.colorFFF3F4,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(16.h),
        child: CustomImageView(
          imagePath: ImageConstant.imgAvatar,
          height: 128.h,
          width: 128.h,
        ),
      ),
    );
  }

  Widget _buildUserInformation(ProfileProvider provider) {
    return Column(
      children: [
        Text(
          provider.profileModel.name ?? '(Name)',
          style: TextStyleHelper.instance.headline24Medium,
        ),
        SizedBox(height: 16.h),
        Text(
          provider.profileModel.email ?? '(Email address)',
          style: TextStyleHelper.instance.title16Medium,
        ),
        SizedBox(height: 16.h),
        Column(
          children: [
            Text(
              'Role',
              style: TextStyleHelper.instance.title16Medium
                  .copyWith(color: appTheme.colorFF9CA3),
            ),
            SizedBox(height: 4.h),
            Text(
              provider.profileModel.role ?? '(Role)',
              style: TextStyleHelper.instance.title16Medium,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(ProfileProvider provider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Edit?',
          onPressed: () => provider.onEditProfile(),
        ),
        SizedBox(width: 16.h),
        CustomButton(
          text: 'Logout?',
          onPressed: () => provider.onLogout(),
        ),
      ],
    );
  }

  Widget _buildSettingsMenu(ProfileProvider provider) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTheme.colorFFE5E7,
            width: 1.h,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildSettingsItem(
            icon: ImageConstant.imgQuestioncircle24,
            title: 'Help & support',
            onTap: () => provider.onHelpSupport(),
          ),
          _buildSettingsItem(
            icon: ImageConstant.imgFile24,
            title: 'Terms & conditions',
            onTap: () => provider.onTermsConditions(),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.whiteCustom,
          border: Border(
            bottom: BorderSide(
              color: appTheme.colorFFE5E7,
              width: 1.h,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.h),
        child: Row(
          children: [
            CustomImageView(
              imagePath: icon,
              height: 24.h,
              width: 24.h,
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: Text(
                title,
                style: TextStyleHelper.instance.title16Medium,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgArrowright,
              height: 24.h,
              width: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 88.h,
          decoration: BoxDecoration(
            color: appTheme.colorFF1F29,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomNavItem(
                  icon: ImageConstant.imgDashboarddial24,
                  label: 'Dashboard',
                  onTap: () => provider.onNavigateToDashboard(),
                ),
                _buildBottomNavItem(
                  icon: ImageConstant.imgListunordered24,
                  label: 'Report List',
                  onTap: () => provider.onNavigateToReportList(),
                ),
                _buildBottomNavItem(
                  icon: ImageConstant.imgLocation24,
                  label: 'Report Map',
                  onTap: () => provider.onNavigateToReportMap(),
                ),
                _buildBottomNavItem(
                  icon: ImageConstant.imgIconAccountManage,
                  label: 'Account',
                  isActive: true,
                  onTap: () => provider.onNavigateToAccount(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavItem({
    required String icon,
    required String label,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: isActive
                ? BoxDecoration(
                    color: appTheme.blackCustom,
                    borderRadius: BorderRadius.circular(16.h),
                  )
                : null,
            padding: isActive ? EdgeInsets.all(8.h) : EdgeInsets.zero,
            child: CustomImageView(
              imagePath: icon,
              height: 24.h,
              width: 24.h,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyleHelper.instance.body12Black,
          ),
        ],
      ),
    );
  }
}
