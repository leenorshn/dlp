import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial());

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
