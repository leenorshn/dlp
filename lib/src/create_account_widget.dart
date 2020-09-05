import 'package:dlp/src/blocAccount/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'input_field.dart';

class CreateAccountWidget extends StatefulWidget {
  final String phone;

  const CreateAccountWidget({Key key, this.phone}) : super(key: key);
  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  var controllerName = TextEditingController();
  var controllerAddress = TextEditingController();
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountBloc>(
      create: (context) => AccountBloc(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
          if (state is AccountProcessingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AccountCreatedDoneState) {
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
                  "Creation de compte Reussi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff21ce99),
                  ),
                ),
                SizedBox(
                  height: 18,
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
          if (state is AccountCreatedFailureState) {
            return Column(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  child: Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 56,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Erreur de creation de compte",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 18,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Configuration payment",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff21ce99),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "Votre compte de payement doit etre associer a votre numero et un pin de securite",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              InputField(
                hint: "Nom et post nom",
                label: "Identite",
                sise: 12,
                controller: controllerName,
                isPassword: false,
                keyBoardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              InputField(
                hint: "Votre adresse",
                controller: controllerAddress,
                label: "Adresse",
                sise: 12,
                isPassword: false,
                keyBoardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              PinEntryTextField(
                isTextObscure: true,
                textColor: Colors.blueGrey,
                cursorColor: Colors.teal,
                onSubmit: (value) {
                  pin = value;
                },
              ),
              SizedBox(
                height: 56,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                onPressed: () {
                  BlocProvider.of<AccountBloc>(context)
                    ..add(
                      AddNewAccountEvent(
                        phone: widget.phone,
                        name: controllerName.text,
                        pin: pin,
                        address: controllerAddress.text,
                      ),
                    );
                },
                child: Text("Congigurer"),
                textColor: Colors.white,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          );
        }),
      ),
    );
  }
}
