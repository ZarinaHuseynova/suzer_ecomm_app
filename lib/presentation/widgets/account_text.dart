import 'package:flutter/material.dart';

import '../screens/auth/register_screen.dart';
import '../screens/styles/app_text_styles.dart';

class AccountText extends StatelessWidget {
  const AccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: AppTextStyles.loginWithTitleStyle,
          ),
          TextButton(
              onPressed: (() {
                Navigator.pushNamed(
                    context, RegisterScreen.routeName);
              }),
              child: Text(
                'Register',
                style: AppTextStyles.registerTextStyle,
              ))
        ],
      ),
    );
  }
}