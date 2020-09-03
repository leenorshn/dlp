import 'dart:convert';

import 'package:dlp/src/trans_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/account_info.dart';

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
      return null;
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
      return null;
    }
  }

  static login({phone, password}) async {
    var response = await http.post(_baseUrl + "/login",
        body: jsonEncode({"phone": phone, "password": password}),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
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

  static signUp(
      {@required String phone,
      @required String pin,
      @required String name,
      @required String address}) async {
    var response = await http.post(_baseUrl + "/signup",
        body: jsonEncode({
          "phone": phone,
          "pin": pin,
          "name": name,
          "address": address,
        }),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<TransResult> payer({phone, pin, amount, provider}) async {
    var response = await http.post(_baseUrl + "/api/trans",
        body: jsonEncode({
          "phone": phone,
          "pin": pin,
          "amount": amount,
          "provider": provider ?? "tayarifood"
        }),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      var transResultJson = jsonDecode(response.body);
      return TransResult.fromJson(transResultJson);
    } else {
      return null;
    }
  }
}
