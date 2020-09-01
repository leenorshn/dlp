import 'package:flutter/material.dart';

import 'dlp_api.dart';
import 'input_field.dart';

class DlpPaymentWidget extends StatefulWidget {
  final String phone;
  final int amount;
  final String pin;
  final String provider;

  ///All params are a must to be field
  const DlpPaymentWidget({
    Key key,
    @required this.phone,
    @required this.amount,
    @required this.pin,
    @required this.provider,
  }) : super(key: key);
  @override
  _DlpPaymentWidgetState createState() => _DlpPaymentWidgetState();
}

class _DlpPaymentWidgetState extends State<DlpPaymentWidget> {
  bool inProcess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 340,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Stack(
        children: [
          Column(
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
              inProcess
                  ? Container()
                  : Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          "Entrez votre Pin",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
              inProcess
                  ? Container()
                  : PinEntryTextField(
                      isTextObscure: true,
                      textColor: Colors.blueGrey,
                      cursorColor: Colors.white,
                      onSubmit: (value) {
                        print(value);
                      },
                    ),
              SizedBox(
                height: 32,
              ),
              inProcess
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      padding: EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 40,
                      ),
                      color: Colors.black,
                      textColor: Colors.white,
                      onPressed: () async {
                        setState(() {
                          inProcess = true;
                        });
                        await DlpApi.payer(
                          phone: widget.phone,
                          amount: widget.amount,
                          pin: widget.pin,
                          provider: widget.provider,
                        );
                      },
                      child: Text("Payer"),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
