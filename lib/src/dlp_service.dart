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

  Future signUp({phone, name, pin, address}) async {
    var data = await DlpApi.signUp(
        pin: pin, phone: phone, address: address, name: name);
    if (data != null) {
      return 1;
    } else {
      return 0;
    }
  }

  verifyPhoneNumber({String phone}) async {
    return DlpApi.verifyPhone(phone: phone);
  }

  verifySms({@required String phone, @required String code}) {
    return DlpApi.smsPhoneVerify(phone: phone, code: code);
  }
}
