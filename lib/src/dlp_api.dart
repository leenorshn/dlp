import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'models/account_info.dart';
import 'models/trans_result.dart';

class DlpApi {
  DlpApi._();

  static String _baseUrl = "https://dlp-service-5qvdijzm7q-ew.a.run.app";

  static verifyPhone({phone}) async {
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

  static Future<DlpAccount> signUp(
      {@required String phone,
      @required String pin,
      @required String name,
      @required String address}) async {
    var response = await http.post(_baseUrl + "/signup",
        body: jsonEncode({
          "phone": phone,
          "pin": pin,
          "name": name,
          "role": "client",
          "address": address,
          "isVerified": true,
        }),
        headers: {"content-type": "application/json"});

    if (response.statusCode == 201) {
      var dataJson = jsonDecode(response.body);
      return DlpAccount.fromJson(dataJson);
    } else {
      return null;
    }
  }

  static Future<TransResult> payer(
      {fromPhone, toPhone, currency, pin, amount, provider}) async {
    var response = await http.post(_baseUrl + "/api/trans",
        body: jsonEncode({
          "fromPhone": fromPhone,
          "toPhone": toPhone,
          "typeTrans": "Payment",
          "pin": pin,
          "currency": currency,
          "amount": amount,
          "provider": provider ?? "dlp"
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
