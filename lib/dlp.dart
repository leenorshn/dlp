library dlp;

import 'package:dlp/dlp_service/dlp_api.dart';
import 'package:flutter/material.dart';

/// A Calculator.
///
class DlpService extends StatefulWidget {
  @override
  _DlpServiceState createState() => _DlpServiceState();
}

class _DlpServiceState extends State<DlpService> {
  String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 260,
          child: Column(
            children: [
              Text("Deelpay service"),
              Text("Phone verification"),
              TextField(
                decoration: InputDecoration(hintText: "Phone number"),
                onChanged: (v) {
                  setState(() {
                    phone = v;
                  });
                },
              ),
              RaisedButton(
                onPressed: () async {
                  await DlpApi.verifyPhone(phone: phone);
                },
                child: Text("verify"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
