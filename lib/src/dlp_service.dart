import 'package:flutter/material.dart';

import 'dlp_api.dart';
import 'models/account_info.dart';

/// Dlp service lib
class DlpService {
  DlpService();
  Future<DlpAccount> getMyAccountInfo(String phone) async {
    print("Phone===> $phone");
    DlpAccount accountInfo = await DlpApi.getAccountInfo(phone: phone);
    print(accountInfo.toString());
    return accountInfo;
  }

  Future<DlpAccount> signUp({phone, name, pin, address}) async {
    DlpAccount data = await DlpApi.signUp(
      pin: "1289",
      phone: "+243825342047",
      address: "Butembo",
      name: "Victor-test",
    );
    if (data != null) {
      print("*****>>>> " + data.toString());
      return data;
    } else {
      return null;
    }
  }

  verifyPhoneNumber({String phone}) async {
    return DlpApi.verifyPhone(phone: phone);
  }

  verifySms({@required String phone, @required String code}) {
    return DlpApi.smsPhoneVerify(phone: phone, code: code);
  }
}
