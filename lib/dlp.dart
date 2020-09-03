library dlp;

import 'package:dlp/src/dlp_payment_widget.dart';
import 'package:flutter/material.dart';

class DlpWidget {
  static show(BuildContext context,
      {@required String phone,
      @required int amount,
      @required String provider}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 7,
          child: DlpPaymentWidget(
            phone: phone,
            amount: amount,
            provider: provider,
          ),
        );
      },
    );
  }
}
