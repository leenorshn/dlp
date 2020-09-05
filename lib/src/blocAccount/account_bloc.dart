import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dlp/dlp.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../dlp_api.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    if (event is LoadAccountEvent) {
      yield AccountInitial();
    }

    if (event is AddNewAccountEvent) {
      yield AccountProcessingState();
      DlpAccount dlpAccount = await DlpApi.signUp(
        phone: event.phone,
        pin: event.pin,
        name: event.name,
        address: event.address,
      );

      if (dlpAccount == null) {
        yield AccountCreatedFailureState();
      } else {
        yield AccountCreatedDoneState();
      }
    }
  }
}
