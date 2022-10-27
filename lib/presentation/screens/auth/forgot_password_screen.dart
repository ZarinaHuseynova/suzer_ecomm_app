import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';
import 'package:suzer_ecom_appp/global/constants/app_text.dart';
import 'package:suzer_ecom_appp/presentation/screens/widgets/global_imput.dart';
import 'package:suzer_ecom_appp/presentation/widgets/account_text.dart';
import '../../widgets/global_center_icon.dart';
import '../styles/app_text_styles.dart';
import '../../../global/constants/app_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = "/forgot_password";
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;
  late FocusNode emailFocus;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool isMail = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    emailFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff223263)),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: Text(
          'Forgot Password',
          style: AppTextStyles.signinTitleStyle,
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Center(
              child: GlobalIconWidget(),
            ),
            AppSizedBox.sizedBox24,
            Text(
              "Forgot Password",
              style: AppTextStyles.headingTitleStyle,
            ),
            AppSizedBox.sizedBox16,
            Text(
              kEmailNullError,
              style: AppTextStyles.loginWithTitleStyle,
            ),
            AppSizedBox.sizedBox32,
            Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlobalImput(
                        isCorrect: false,
                        controller: emailController,
                        focus: emailFocus,
                        prefixIcon: const Icon(Icons.email),
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
                        labelText: 'Email',
                        hintText: 'Enter your mail')
                  ],
                )),
            AppSizedBox.sizedBox12,
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                },
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Send',
                    style: AppTextStyles.loginTextStyle,
                  ),
                ),
              ),
            ),
            AppSizedBox.sizedBox24,
            const AccountText()
          ]),
        ),
      )),
    );
  }
}
