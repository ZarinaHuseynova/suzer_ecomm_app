
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suzer_ecom_appp/presentation/routes/routes.dart';
import 'package:suzer_ecom_appp/presentation/screens/auth/login_screen.dart';
import 'package:suzer_ecom_appp/presentation/screens/home/home_screen.dart';
String? email;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPreference();
  //await Firebase.initializeApp();
  runApp(const MyApp());
}

Future<void> getPreference() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  email = sharedPreferences.getString('email');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      //home: const LoginScreen(),
      initialRoute: LoginScreen.routeName,
      //home: const HomeScreen(),
     // initialRoute: HomeScreen.routeName,

      routes: routes,
    );
  }
}
