import 'package:delivery_app/src/routes/routes.dart';
import 'package:delivery_app/src/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:delivery_app/src/ui/pages/home/home_page.dart';
import 'package:delivery_app/src/ui/pages/login/login_page.dart';
import 'package:delivery_app/src/ui/pages/onboard/onboard_page.dart';
import 'package:delivery_app/src/ui/pages/register/register_page.dart';
import 'package:delivery_app/src/ui/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

abstract class Pages {
  static const String INITIAL = Routes.INITIAL;

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (_) => const OnboardPage(),
    Routes.WELCOME: (_) => const WelcomePage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.FORGOT_PASSWORD: (_) => const ForgotPasswordPage(),
    Routes.HOME: (_) => const HomePage(),
  };
}
