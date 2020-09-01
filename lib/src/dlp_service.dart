import 'package:flutter/material.dart';

import 'account_info.dart';
import 'dlp_api.dart';

/// Dlp service lib
class DlpService {
  DlpService();
  Future<AccountInfo> getMyAccountInfo(String phone) async {
    AccountInfo accountInfo = await DlpApi.getAccountInfo(phone: phone);
    print(accountInfo.toString());
    return accountInfo;
  }

  verifyPhoneNumber({String phone}) async {
    return DlpApi.verifyPhone(phone: phone);
  }

  verifySms({@required String phone, @required String code}) {
    return DlpApi.smsPhoneVerify(phone: phone, code: code);
  }
}
