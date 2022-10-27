import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';
import 'package:suzer_ecom_appp/global/constants/app_text.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/login_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/register_succsess_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/widgets/global_imput.dart';
import 'package:suzer_ecom_appp/presentation/widgets/global_center_icon.dart';
import '../styles/app_text_styles.dart';
import '../../../global/constants/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController nameController;
  late FocusNode nameFocus;
  late TextEditingController surnameController;
  late FocusNode surnameFocus;
  late TextEditingController emailController;
  late FocusNode emailFocus;
  late TextEditingController passwordController;
  late FocusNode passwordFocus;
  late TextEditingController againPasswordController;
  late FocusNode againPasswordFocus;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    nameFocus = FocusNode();
    surnameController = TextEditingController();
    surnameFocus = FocusNode();
    emailController = TextEditingController();
    emailFocus = FocusNode();
    passwordController = TextEditingController();
    passwordFocus = FocusNode();
    againPasswordController = TextEditingController();
    againPasswordFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    surnameController.dispose();
    surnameFocus.dispose();
    emailController.dispose();
    emailFocus.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
    nameController.dispose();
    nameFocus.dispose();
    againPasswordController.dispose();
    againPasswordFocus.dispose();
  }

  void removeError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
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
                  const Center(
                    child: GlobalIconWidget(),
                  ),
                  AppSizedBox.sizedBox24,
                  Text(
                    "Let's Gets Startet",
                    style: AppTextStyles.headingTitleStyle,
                  ),
                  AppSizedBox.sizedBox16,
                  Text(
                    'Create on new occount',
                    style: AppTextStyles.signinTitleStyle,
                  ),
                  AppSizedBox.sizedBox32,
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GlobalImput(
                          isCorrect: false,
                          hintText: 'Enter your name',
                          labelText: 'Name',
                          controller: nameController,
                          focus: nameFocus,
                          onChanged: (v) {
                            if (v.isEmpty && !errors.contains(kNameNullError)) {
                              setState(() {
                                errors.add(kNameNullError);
                              });
                            }
                            return;
                          },
                          validator: (v) {
                            if (v!.isEmpty || v == "") {
                              return kNameNullError;
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                        ),
                        AppSizedBox.sizedBox12,
                        GlobalImput(
                          isCorrect: false,
                          hintText: 'Enter your surname',
                          labelText: 'Surname',
                          controller: surnameController,
                          focus: surnameFocus,
                          onChanged: (v) {
                            if (v.isEmpty &&
                                !errors.contains(kSurnameNullError)) {
                              setState(() {
                                errors.add(kSurnameNullError);
                              });
                            }
                            return;
                          },
                          validator: (v) {
                            if (v!.isEmpty || v == "") {
                              return kSurnameNullError;
                            }
                            return null;
                          },
                          prefixIcon: const Icon(Icons.person),
                        ),
                        AppSizedBox.sizedBox12,
                        GlobalImput(
                          isCorrect: false,
                          hintText: 'Enter your email',
                          labelText: 'Email',
                          controller: emailController,
                          focus: emailFocus,
                          onChanged: (v) {
                            if (v.isEmpty &&
                                !errors.contains(kEmailNullError)) {
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
                        AppSizedBox.sizedBox12,
                        GlobalImput(
                          isCorrect: false,
                          hintText: 'Enter your againpassword',
                          isPassword: true,
                          labelText: 'Again password',
                          controller: againPasswordController,
                          focus: againPasswordFocus,
                          onChanged: (v) {
                            if (passwordController != againPasswordController) {
                              removeError(error: kMathPassError);
                            }
                          },
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
                  AppSizedBox.sizedBox24,
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 54)),
                      onPressed: (() {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement<void, void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const RegisterSuccsessScreen()));
                        }
                      }),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Sign Up',
                          style: AppTextStyles.loginTextStyle,
                        ),
                      ),
                    ),
                  ),
                  AppSizedBox.sizedBox24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Have an account?",
                          style: AppTextStyles.loginWithTitleStyle,
                        ),
                        TextButton(
                            onPressed: (() {
                              Navigator.pushNamed(
                                  context, LoginScreen.routeName);
                            }),
                            child: Text(
                              'Sign In',
                              style: AppTextStyles.registerTextStyle,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // void _completeRegister() {
  //   Navigator.pushReplacement<void, void>(
  //       context,
  //       MaterialPageRoute<void>(
  //           builder: (BuildContext context) => const RegisterSuccsessScreen()));
  // }
}

  

//eve.holt@reqres.in
// cityslicka
