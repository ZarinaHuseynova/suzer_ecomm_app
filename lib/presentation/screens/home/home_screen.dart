import 'package:flutter/material.dart';
import 'package:suzer_ecom_appp/presentation/screens/styles/app_text_styles.dart';
import '../themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Welcome to E-comm',
                    style:AppTextStyles.headingTitleStyle,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    children: [
                      Text(
                        'Sign in to continue',
                        style: AppTextStyles.signinTitleStyle,
                      ),
                    ],
                  ),
                   const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.mail,color: AppColors.textColor,),
                  hintText: 'Your email',
                  border: OutlineInputBorder(
                  borderSide: BorderSide(color:AppColors.primarygrey,)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(10),
               child: TextFormField(
                decoration:  InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: AppColors.textColor,),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                  borderSide: BorderSide(color:AppColors.primarygrey,)
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
