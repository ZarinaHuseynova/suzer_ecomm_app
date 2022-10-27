import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/forgot_password_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/login_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/register_succsess_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/register_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => const LoginScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  HomeScreen.routeName :(context) =>  const HomeScreen(),
  RegisterSuccsessScreen.routeName :(context) => const RegisterSuccsessScreen(),
};
