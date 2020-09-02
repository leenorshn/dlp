library dlp;

import 'package:dlp/src/dlp_payment_widget.dart';
import 'package:flutter/material.dart';

export 'src/account_info.dart';
export 'src/dlp_service.dart';

class DlpWidget {
  show(BuildContext context, {phone, amount, pin, provider}) {
    showDialog(
      context: context,
      builder: (context) {
        return DlpPaymentWidget(
          phone: phone,
          amount: amount,
          pin: pin,
          provider: provider,
        );
      },
    );
  }
}
