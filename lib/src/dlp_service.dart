import 'package:dlp/src/models/trans_result.dart';
import 'package:flutter/material.dart';

import 'dlp_api.dart';
import 'models/account_info.dart';

/// Dlp service lib
class DlpService {
  DlpService();
  Future<DlpAccount> getMyAccountInfo(String phone) async {
    DlpAccount accountInfo = await DlpApi.getAccountInfo(phone: phone);
    return accountInfo;
  }

  Future<DlpAccount> signUp({phone, name, pin, address}) async {
    DlpAccount data = await DlpApi.signUp(
      pin: pin,
      phone: phone,
      address: address,
      name: name,
    );

    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<TransResult> payer(
      {String pin,
      String provider,
      int amount,
      String currency,
      String fromPhone,
      toPhone}) async {
    TransResult transResult = await DlpApi.payer(
      pin: pin,
      provider: provider,
      amount: amount,
      currency: currency,
      fromPhone: fromPhone,
      toPhone: toPhone,
    );

    return transResult;
  }

  verifyPhoneNumber({String phone}) async {
    return DlpApi.verifyPhone(phone: phone);
  }

  verifySms({@required String phone, @required String code}) {
    return DlpApi.smsPhoneVerify(phone: phone, code: code);
  }
}
