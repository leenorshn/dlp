part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();
  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {
  @override
  List<Object> get props => [];
}

class AccountCreatedDoneState extends AccountState {}

class AccountCreatedFailureState extends AccountState {}

class AccountProcessingState extends AccountState {}
