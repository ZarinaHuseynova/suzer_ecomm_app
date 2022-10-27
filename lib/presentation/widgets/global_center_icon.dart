import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/global/constants/app_assets.dart';
import 'package:suzer_ecom_appp/presentation/screens/styles/app_border_radius.dart';
import '../../global/constants/app_colors.dart';
class GlobalIconWidget extends StatelessWidget {
  const GlobalIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.borderRadius16,
        color: AppColors.primaryColor,
      ),
      child:  Image.asset(AppAssets.diamondShape)
    );
  }
}