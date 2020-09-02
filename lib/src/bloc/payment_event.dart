part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class LoadPaymentEvent extends PaymentEvent {}

class AddPaymentEvent extends PaymentEvent {
  final PaymentInput paymentInput;

  AddPaymentEvent(this.paymentInput);
}
