import 'dart:convert';

import 'package:http/http.dart' as http;

import 'account_info.dart';

class DlpApi {
  DlpApi._();

  static String _baseUrl = "http://192.168.43.58:4000";

  static verifyPhone({phone}) async {
    print(phone);
    var response = await http.post(_baseUrl + "/verify-phone",
        body: jsonEncode({'phone': phone}),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }

  static smsPhoneVerify({String phone, String code}) async {
    print(phone);
    var response = await http.post(_baseUrl + "/verify-sms",
        body: jsonEncode({'phone': phone, "code": code}),
        headers: {"content-type": "application/json"});
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }

  static login({phone, password}) async {
    var response = await http.post(_baseUrl + "/login",
        body: jsonEncode({"phone": phone, "password": password}),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }

  static Future<DlpAccount> getAccountInfo({String phone}) async {
    var response = await http.get(_baseUrl + "/api/accounts/$phone",
        headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      var jsonD = jsonDecode(response.body);
      return DlpAccount.fromJson(jsonD as Map<String, dynamic>);
    } else {
      return null;
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
          "phone": "+243978154329",
          "pin": "1234",
          "amount": 400,
          "provider": provider ?? "tayarifood"
        }),
        headers: {"content-type": "application/json"});
    print(response.body);

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return "Error ${response.statusCode}:${response.body}";
    }
  }
}
