import 'package:dlp/dlp.dart';
import 'package:dlp/src/bloc/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_field.dart';

class DlpPaymentWidget extends StatefulWidget {
  final String phone;
  final int amount;
  final String provider;

  ///All params are a must to be field
  const DlpPaymentWidget({
    Key key,
    @required this.phone,
    @required this.amount,
    @required this.provider,
  }) : super(key: key);
  @override
  _DlpPaymentWidgetState createState() => _DlpPaymentWidgetState();
}

class _DlpPaymentWidgetState extends State<DlpPaymentWidget> {
  String pin = "";
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentBloc>(
      create: (context) => PaymentBloc()..add(LoadPaymentEvent()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 340,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Paiement",
              style: TextStyle(
                color: Color(0xff21ce99),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${widget.phone}",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              "Vous etes factures",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: "${widget.amount ?? 0} ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Color(0xff143D80),
                  ),
                ),
                TextSpan(
                  text: "CDF",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Color(0xff143D80),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 24,
            ),
            BlocBuilder<PaymentBloc, PaymentState>(builder: (context, state) {
              if (state is PaymentInProcess) {
                return CircularProgressIndicator();
              }

              if (state is PaymentDone) {
                return Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      child: Center(
                        child: Icon(
                          Icons.done_all,
                          size: 48,
                          color: Color(0xff21ce99),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Paiement Reussi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff21ce99),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Fermer"),
                    ),
                  ],
                );
              }

              if (state is PaymentError) {
                return Column(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      child: Center(
                        child: Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Fermer"),
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        "Entrez votre Pin",
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  PinEntryTextField(
                    isTextObscure: true,
                    textColor: Colors.blueGrey,
                    cursorColor: Colors.teal,
                    onSubmit: (value) {
                      pin = value;
                    },
                  ),
                  Text("$_message"),
                  SizedBox(
                    height: 32,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 40,
                    ),
                    color: Colors.black,
                    textColor: Colors.white,
                    onPressed: () {
                      if (pin.length != 4) {
                        setState(() {
                          _message = "error verifier votre pin";
                        });
                      } else {
                        BlocProvider.of<PaymentBloc>(context)
                          ..add(
                            AddPaymentEvent(
                              PaymentInput(
                                phone: widget.phone,
                                pin: pin,
                                amount: widget.amount,
                                provider: widget.provider,
                              ),
                            ),
                          );
                      }
                    },
                    child: Text("Payer"),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
