part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class LoadAccountEvent extends AccountEvent {}

class AddNewAccountEvent extends AccountEvent {
  final String phone;
  final String name;
  final String pin;
  final String address;

  AddNewAccountEvent({
    @required this.phone,
    @required this.name,
    @required this.pin,
    @required this.address,
  });

  @override
  List<Object> get props => [phone, name, pin, address];
}
