import 'dart:convert';

import 'package:http/http.dart';

class LoginData {
  static Future loginData( String email , String password,) async {
    Uri url = Uri.parse('https://reqres.in/api/register');
    var body = {"email":email, "password":password};
    Response response = await post(url, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data['token'];
    } else {
      return null;
    }
  }
}
