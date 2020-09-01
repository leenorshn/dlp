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

  static getAccountInfo({String phone}) async {
    var response = await http.get(_baseUrl + "/api/accounts/$phone",
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }

  static signUp({
    phone,
    password,
    name,
  }) async {
    var response = await http.post(_baseUrl + "/login",
        body: jsonEncode({"phone": phone, "password": password}),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }

  static payer({phone, pin, amount, provider}) async {
    var response = await http.post(_baseUrl + "/api/trans",
        body: jsonEncode({
          "phone": phone,
          "pin": pin,
          "amount": amount,
          "provider": provider ?? "tayarifood"
        }),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return response.body;
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }
}
