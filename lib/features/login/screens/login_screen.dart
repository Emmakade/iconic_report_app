import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
      create: (context) => LoginProvider(),
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LoginProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteCustom,
      body: Consumer<LoginProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              _buildHeader(),
              _buildLocationMarker(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    children: [
                      SizedBox(height: 32.h),
                      _buildTitleText(),
                      SizedBox(height: 32.h),
                      _buildEmailInput(provider),
                      SizedBox(height: 16.h),
                      _buildSendLoginButton(provider),
                      SizedBox(height: 32.h),
                      _buildTermsAndConditions(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 88.h),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 88.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF66C61C),
            appTheme.whiteCustom,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 16.h),
        child: Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              NavigatorService.goBack();
            },
            child: SizedBox(
              width: 24.h,
              height: 24.h,
              child: CustomImageView(
                imagePath: ImageConstant.imgArrowleft,
                height: 24.h,
                width: 24.h,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationMarker() {
    return Container(
      margin: EdgeInsets.only(top: 0.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgMapMarker,
            height: 80.h,
            width: 62.h,
          ),
          Positioned(
            top: 40.h,
            left: 18.h,
            child: Container(
              width: 26.h,
              height: 26.h,
              decoration: BoxDecoration(
                color: appTheme.whiteCustom,
                borderRadius: BorderRadius.circular(13.h),
                boxShadow: [
                  BoxShadow(
                    color: appTheme.blackCustom.withAlpha(38),
                    blurRadius: 24.h,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              child: Center(
                child: CustomImageView(
                  imagePath: ImageConstant.img,
                  height: 16.h,
                  width: 16.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Container(
      constraints: BoxConstraints(maxWidth: 293.h),
      child: Text(
        'Enter your email and we\'ll send you a login link.',
        textAlign: TextAlign.center,
        style: TextStyleHelper.instance.headline24Black.copyWith(height: 1.33),
      ),
    );
  }

  Widget _buildEmailInput(LoginProvider provider) {
    return Container(
      child: Stack(
        children: [
          TextFormField(
            controller: provider.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              fillColor: appTheme.colorFFF4F4,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(
                  color: appTheme.colorFFE4E4,
                  width: 1.h,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(
                  color: appTheme.colorFFE4E4,
                  width: 1.h,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.h),
                borderSide: BorderSide(
                  color: appTheme.colorFF66C6,
                  width: 2.h,
                ),
              ),
              contentPadding: EdgeInsets.only(
                left: 12.h,
                right: 12.h,
                top: 24.h,
                bottom: 8.h,
              ),
              labelText: '',
            ),
            style: TextStyleHelper.instance.title16Medium
                .copyWith(color: appTheme.colorFF2627),
            onChanged: (value) {
              provider.onEmailChanged(value);
            },
          ),
          Positioned(
            left: 12.h,
            top: provider.emailController.text.isEmpty ? 8.h : 8.h,
            child: Text(
              'Email',
              style: TextStyleHelper.instance.bodyTextMedium
                  .copyWith(color: appTheme.colorFF2627),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendLoginButton(LoginProvider provider) {
    return CustomButton(
      text: 'Send login link',
      onPressed: () {
        provider.onSendLoginLink();
      },
      backgroundColor: appTheme.colorFF66C6,
      textColor: appTheme.whiteCustom,
      borderColor: appTheme.colorFF4CA3,
      borderRadius: 20.h,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      fontSize: 16.fSize,
      fontWeight: FontWeight.w900,
    );
  }

  Widget _buildTermsAndConditions() {
    return Column(
      children: [
        Text(
          'Proceeding means you\'re ok with our',
          textAlign: TextAlign.center,
          style: TextStyleHelper.instance.title16Medium
              .copyWith(color: appTheme.colorFF2627, height: 1.19),
        ),
        GestureDetector(
          onTap: () {
            Provider.of<LoginProvider>(context, listen: false).onTermsClick();
          },
          child: Text(
            'terms & conditions',
            style: TextStyleHelper.instance.title16Black.copyWith(height: 1.19),
          ),
        ),
      ],
    );
  }
}
