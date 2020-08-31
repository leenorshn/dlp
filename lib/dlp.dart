library dlp;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

/// dlp service clientLib
class DlpService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 340,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
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
          Text(
            "2000\$",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color(0xff143D80),
            ),
          ),
          SizedBox(
            height: 40,
          ),
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
            cursorColor: Colors.white,
            onSubmit: (value) {
              print(value);
            },
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Payer"),
          )
        ],
      ),
    );
  }
}
