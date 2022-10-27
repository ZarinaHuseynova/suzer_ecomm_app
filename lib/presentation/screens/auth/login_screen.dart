import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';
import 'package:suzer_ecom_appp/global/constants/app_assets.dart';
import 'package:suzer_ecom_appp/global/constants/app_text.dart';
import 'package:suzer_ecom_appp/presentation/data/login_data.dart';
import 'package:suzer_ecom_appp/presentation/routes/global_routes.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/forgot_password_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/home_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/styles/app_text_styles.dart';
import 'package:suzer_ecom_appp/presentation/screens/widgets/global_imput.dart';
import 'package:suzer_ecom_appp/presentation/widgets/account_text.dart';
import 'package:suzer_ecom_appp/presentation/widgets/global_center_icon.dart';
import '../../../global/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late FocusNode emailFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  bool isCorrect = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocus = FocusNode();
    passwordController = TextEditingController();
    passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocus.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(child: GlobalIconWidget()),
                AppSizedBox.sizedBox24,
                Text(
                  'Welcome to E-comm',
                  style: AppTextStyles.headingTitleStyle,
                ),
                AppSizedBox.sizedBox16,
                Text(
                  'Sign in to continue',
                  style: AppTextStyles.signinTitleStyle,
                ),
                AppSizedBox.sizedBox16,
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalImput(
                        isCorrect: false,
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        controller: emailController,
                        focus: emailFocus,
                        onChanged: (v) {
                          if (v.isEmpty && !errors.contains(kEmailNullError)) {
                            setState(() {
                              errors.add(kEmailNullError);
                            });
                          }
                          return;
                        },
                        validator: (v) {
                          if (v!.isEmpty || v == "") {
                            return kEmailNullError;
                          } else if (!v.contains('@')) {
                            return kNotEmail;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.email),
                      ),
                      AppSizedBox.sizedBox12,
                      GlobalImput(
                        isCorrect: false,
                        hintText: 'Enter your password',
                        isPassword: true,
                        labelText: 'Password',
                        controller: passwordController,
                        focus: passwordFocus,
                        onChanged: (v) {},
                        validator: (v) {
                          if (v!.isEmpty || v == "") {
                            return kPassNullError;
                          } else if (v.length < 8) {
                            return kShortPassError;
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ],
                  ),
                ),
                AppSizedBox.sizedBox12,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 54)),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var token = await LoginData.loginData(
                            emailController.text, passwordController.text);
                        if (token is String) {
                          GlobalRoutes();
                          _completeLogin();
                        }
                      }
                    },
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign in',
                        style: AppTextStyles.loginTextStyle,
                      ),
                    ),
                  ),
                ),
                AppSizedBox.sizedBox24,
                Image.asset(AppAssets.orLine),
                AppSizedBox.sizedBox12,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: AppColors.lightGrey,
                  )),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Image.asset(AppAssets.googleIcon),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text(
                          'Login with Google',
                          style: TextStyle(
                            color: AppColors.neuturalGreyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSizedBox.sizedBox8,
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: AppColors.lightGrey,
                  )),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Image.asset(AppAssets.facebookIcon),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: Text(
                          'Login with Facebook',
                          style: TextStyle(
                            color: AppColors.neuturalGreyColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSizedBox.sizedBox12,
                TextButton(
                  onPressed: (() {
                    Navigator.pushNamed(
                        context, ForgotPasswordScreen.routeName);
                  }),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xff40bfff),
                    ),
                  ),
                ),
                const AccountText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _completeLogin() {
    Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const HomeScreen()));
  }
}
