import 'package:europa_lock/app/bindings/FAQ_bindings.dart';
import 'package:europa_lock/app/bindings/about_us_bindings.dart';
import 'package:europa_lock/app/bindings/feedback_bindings.dart';
import 'package:europa_lock/app/bindings/profile_setting_bindings.dart';
import 'package:europa_lock/app/bindings/subscription_bindings.dart';
import 'package:europa_lock/app/bindings/system_notification_bindings.dart';
import 'package:europa_lock/app/bindings/user_manual_bindings.dart';
import 'package:europa_lock/presentation/modules/create_account/views/privacy_policy.dart';
import 'package:europa_lock/presentation/modules/profile/FAQ/FAQ_view.dart';
import 'package:europa_lock/presentation/modules/profile/about_us/about_us_view.dart';
import 'package:europa_lock/presentation/modules/profile/feedback/feedback_view.dart';
import 'package:europa_lock/presentation/modules/profile/profile_setting/profile_setting_view.dart';
import 'package:europa_lock/presentation/modules/profile/subscription/subscription_view.dart';
import 'package:europa_lock/presentation/modules/profile/system_notification/system_notification_view.dart';
import 'package:europa_lock/presentation/modules/profile/user_manual/user_manual_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:europa_lock/presentation/modules/create_account/views/create_account.dart';
import 'package:europa_lock/presentation/modules/create_account/views/verify_email.dart';
import 'package:europa_lock/presentation/modules/create_account/views/verify_phone.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/create_new_password.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/email_verify_otp.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/forgot_email.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/forgot_password.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/forgot_password_otp.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/password.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/phone_verify_otp.dart';
import 'package:europa_lock/presentation/modules/sign_in/views/sign_in.dart';
import 'package:europa_lock/app/bindings/create_account_bindings.dart';
import 'package:europa_lock/app/bindings/create_new_password_bindings.dart';
import 'package:europa_lock/app/bindings/email_verify_otp_bindings.dart';
import 'package:europa_lock/app/bindings/forgot_email_bindings.dart';
import 'package:europa_lock/app/bindings/forgot_password_bindings.dart';
import 'package:europa_lock/app/bindings/forgot_password_otp_bindings.dart';
import 'package:europa_lock/app/bindings/password_bindings.dart';
import 'package:europa_lock/app/bindings/phone_verify_otp_bindings.dart';
import 'package:europa_lock/app/bindings/sign_in_bindings.dart';
import 'package:europa_lock/app/bindings/verify_email_bindings.dart';
import 'package:europa_lock/app/bindings/verify_phone_bindings.dart';
import '../../presentation/modules/create_account/views/terms_and_conditions.dart';
import '../../presentation/modules/home/home_view.dart';
import '../../presentation/modules/profile/profile_main/views/profile_page_view.dart';
import '../bindings/home_bindings.dart';
import '../bindings/profile_page_bindings.dart';

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
  GetPage(
    name: '/home_view',
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: '/profile_page_view',
    page: () => const ProfilePageView(),
    binding: ProfilePageBinding(),
  ),
  GetPage(
    name: '/profile_setting_view',
    page: () => const ProfileSettingView(),
    binding: ProfileSettingBindings(),
  ),
  GetPage(
    name: '/system_notification_view',
    page: () => const SystemNotificationView(),
    binding: SystemNotificationBindings(),
  ),
  GetPage(
    name: '/about_us',
    page: () => const AboutUs(),
    binding: AboutUsBindings(),
  ),
  GetPage(
    name: '/subscription_view',
    page: () => const SubscriptionView(),
    binding: SubscriptionBindings(),
  ),
  GetPage(
    name: '/feedback_view',
    page: () => const FeedbackView(),
    binding: FeedbackBindings(),
  ),
  GetPage(
    name: '/user_manual_view',
    page: () => const UserManualView(),
    binding: UserManualBindings(),
  ),
  GetPage(
    name: '/FAQ_view',
    page: () => const FaqView(),
    binding: FaqBindings(),
  ),
  GetPage(
    name: '/terms_and_conditions',
    page: () => const TermsAndConditions(),
  ),
  GetPage(
    name: '/privacy_policy',
    page: () => const PrivacyPolicy(),
  ),
];
