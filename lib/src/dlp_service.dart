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
    print("***********  " + pin + phone + address + name + "  ***********");
    DlpAccount data = await DlpApi.signUp(
      pin: pin,
      phone: phone,
      address: address,
      name: name,
    );
    print("***********  " + data.toString() + "  ***********");
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
