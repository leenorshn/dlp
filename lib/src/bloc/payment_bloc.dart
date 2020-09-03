import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dlp/src/dlp_api.dart';
import 'package:dlp/src/trans_result.dart';
import 'package:meta/meta.dart';

import '../account_info.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if (event is LoadPaymentEvent) {
      yield PaymentInitial();
    }

    if (event is AddPaymentEvent) {
      yield PaymentInProcess();
      TransResult transResult = await DlpApi.payer(
        phone: event.paymentInput.phone,
        provider: event.paymentInput.provider,
        pin: event.paymentInput.pin,
        amount: event.paymentInput.amount,
      );
      if (transResult == null) {
        yield PaymentError();
      }
      if (transResult != null) {
        yield PaymentDone();
      }
    }
  }
}
