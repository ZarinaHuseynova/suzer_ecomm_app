import 'package:flutter/cupertino.dart';
import 'package:suzer_ecom_appp/presentation/screens/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle get reccomendedTextStyle => TextStyle(
        fontSize: 24,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      );
  static TextStyle get headingTitleStyle =>  TextStyle(
        fontSize: 24,
        color: AppColors.textColor,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.15,
      );
  static TextStyle get signinTitleStyle =>  TextStyle(
        fontSize: 18,
        color: AppColors.primarygrey,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.18,
      );
   static TextStyle get loginTextStyle =>  TextStyle(
        fontSize: 14,
        color: AppColors.primarygrey,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );
  static TextStyle get textStyle =>  TextStyle(
        fontSize: 10,
        color: AppColors.primarygrey,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );
   static TextStyle get priceMiniTextStyle =>  TextStyle(
        fontSize: 12,
        color: AppColors.primaryBlue,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      );
   static TextStyle get priceMaxTextStyle => TextStyle(
        fontSize: 20,
        color: AppColors.primaryBlue,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      );
   static TextStyle get saleTextStyle =>  TextStyle(
        fontSize: 12,
        color: AppColors.errorColor,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      );
  static TextStyle get unsaleTextStyle =>  TextStyle(
        fontSize: 12,
        color: AppColors.primarygrey,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      );
}
