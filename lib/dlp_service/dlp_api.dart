import 'dart:convert';

import 'package:http/http.dart' as http;

class DlpApi {
  DlpApi._();

  static String _baseUrl = "http://192.168.43.58:4000";

  static verifyPhone({phone}) async {
    print(phone);
    var response = await http.post(_baseUrl + "/verify-phone",
        body: jsonEncode({'phone': phone}),
        headers: {"content-type": "application/json"});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  static login({phone, password}) async {
    var response = await http.post(_baseUrl + "/login",
        body: jsonEncode({"phone": phone, "password": password}),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }
}
