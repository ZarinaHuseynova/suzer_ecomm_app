import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/sized_box/sized_box.dart';
import 'package:suzer_ecom_appp/global/constants/app_assets.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/login_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/home_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/styles/app_text_styles.dart';
import '../../../global/constants/app_colors.dart';

class RegisterSuccsessScreen extends StatelessWidget {
  static String routeName = '/login_succsess_screen';
  const RegisterSuccsessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xff223263)),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const Text(
          'Successful Registration',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xff9098b1),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            AppSizedBox.sizedBox56,
            Image.asset(AppAssets.loginSuccsses),
            AppSizedBox.sizedBox48,
            const Text(
              'Successful Registration',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xff223263),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            AppSizedBox.sizedBox56,
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(MediaQuery.of(context).size.width, 54)),
                onPressed: (() {
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Back to home',
                    style: AppTextStyles.loginTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
