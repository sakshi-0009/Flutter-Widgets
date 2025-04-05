import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../presentation/modules/create_account/views/create_account.dart';
import '../../presentation/modules/create_account/views/verify_email.dart';
import '../../presentation/modules/create_account/views/verify_phone.dart';
import '../../presentation/modules/sign_in/views/create_new_password.dart';
import '../../presentation/modules/sign_in/views/email_verify_otp.dart';
import '../../presentation/modules/sign_in/views/forgot_email.dart';
import '../../presentation/modules/sign_in/views/forgot_password.dart';
import '../../presentation/modules/sign_in/views/forgot_password_otp.dart';
import '../../presentation/modules/sign_in/views/password.dart';
import '../../presentation/modules/sign_in/views/phone_verify_otp.dart';
import '../../presentation/modules/sign_in/views/sign_in.dart';
import '../bindings/create_account_bindings.dart';
import '../bindings/create_new_password_bindings.dart';
import '../bindings/email_verify_otp_bindings.dart';
import '../bindings/forgot_email_bindings.dart';
import '../bindings/forgot_password_bindings.dart';
import '../bindings/forgot_password_otp_bindings.dart';
import '../bindings/password_bindings.dart';
import '../bindings/phone_verify_otp_bindings.dart';
import '../bindings/sign_in_bindings.dart';
import '../bindings/verify_email_bindings.dart';
import '../bindings/verify_phone_bindings.dart';

final List<GetPage> getPages = [
  GetPage(
    name: '/sign_in',
    page: () => const SignIn(),
    binding: SignInBindings(),
  ),
  GetPage(
    name: '/password',
    page: () => const Password(),
    binding: PasswordBinding(),
  ),
  GetPage(
    name: '/forgot_password',
    page: () => const ForgotPassword(),
    binding: ForgotPasswordBindings(),
  ),
  GetPage(
    name: '/phone_verify_otp',
    page: () => const PhoneOtp(),
    binding: PhoneVerifyOtpBinding(),
  ),
  GetPage(
    name: '/email_verify_otp',
    page: () => const EmailOtp(),
    binding: EmailVerifyOtpBinding(),
  ),
  GetPage(
    name: '/create_new_password',
    page: () => const CreateNewPassword(),
    binding: CreateNewPasswordBinding(),
  ),
  GetPage(
    name: '/forgot_email',
    page: () => const ForgotEmail(),
    binding: ForgotEmailBindings(),
  ),
  GetPage(
    name: '/forgot_password_otp',
    page: () => const ForgotPasswordOtp(),
    binding: ForgotPasswordOtpBindings(),
  ),
  GetPage(
    name: '/verify_email',
    page: () => const VerifyEmail(),
    binding: VerifyEmailBinding(),
  ),
  GetPage(
    name: '/verify_Phone',
    page: () => const VerifyPhone(),
    binding: VerifyPhoneBindings(),
  ),
  GetPage(
    name: '/create_account',
    page: () => const CreateAccount(),
    binding: CreateAccountBindings(),
  ),

];
