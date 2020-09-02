part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentDone extends PaymentState {}

class PaymentInProcess extends PaymentState {}

class PaymentError extends PaymentState {}
