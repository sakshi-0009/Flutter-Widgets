import 'package:europa_lock/presentation/modules/sign_in/create_new_password.dart';
import 'package:europa_lock/presentation/modules/sign_in/email_restored_successfully.dart';
import 'package:europa_lock/presentation/modules/sign_in/forgot_email.dart';
import 'package:europa_lock/presentation/modules/sign_in/forgot_password.dart';
import 'package:europa_lock/presentation/modules/sign_in/forgot_password_otp.dart';
import 'package:europa_lock/presentation/modules/sign_in/password.dart';
import 'package:europa_lock/presentation/modules/sign_in/email_verify_otp.dart';
import 'package:europa_lock/presentation/modules/sign_in/phone_verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/modules/sign_in/sign_in.dart';
import 'presentation/modules/create_account/create_account.dart';
import 'presentation/modules/home/home.dart';
import 'presentation/modules/profile/profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Europa',
      debugShowCheckedModeBanner: false,
      initialRoute: '/sign_in',
      getPages: [
        GetPage(name: '/sign_in', page: () => const SignIn()),
        GetPage(name: '/create_account', page: () => const CreateAccount()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/password', page: () => const password()),
        GetPage(name: '/profile', page: () => const profile()),
        GetPage(name: '/forgot_email', page: () => const ForgotEmail()),
        GetPage(name: '/forgot_password', page: () => const forgotPassword()),
        GetPage(name: '/create_new_password', page: () => const NewPassword()),
        GetPage(name: '/email_verify_otp', page: () => const EmailOtp()),
        GetPage(name: '/email_restored_successfully', page: () => const RestoredEmail()),
        GetPage(name: '/phone_verify_otp', page: () => const PhoneOtp()),
        GetPage(name: '/forgot_password_otp', page: () => const ForgotPasswordOtp()),

      ],
    );
  }
}
