import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground_shop/config/api_connection.dart';

import 'package:playground_shop/utilities/constants.dart';

import 'package:playground_shop/widgets/raisedbutton_pg.dart';

import 'package:http/http.dart' as http;

class ForgotPassSmsForm extends StatefulWidget {
  const ForgotPassSmsForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassSmsForm> createState() => _ForgotPassSmsFormState();
}

class _ForgotPassSmsFormState extends State<ForgotPassSmsForm> {
  final _formKey = GlobalKey<FormState>();
  String _phone = '';


  final _passwordFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();

  final RegExp phoneRegex = RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$');

  @override
  void initState() {
    super.initState();
    print('initState called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate called');
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _phoneFocusNode.dispose();

    super.dispose();
  }

  void _saveForm() async {
    _formKey.currentState!.save();

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      print('Error');
      return;
    }
    print('Form was submitted');
    print('Phone: ${_phone}');


    //getData();
  }

  // void getData() async {
  //   ApiConnection apiConnection =
  //       ApiConnection(phoneNumber: _phone, password: _password);

  //   http.Response response = await http.post(apiConnection.logInPostEndPoint());

  //   if (response.statusCode == 200 &&
  //       jsonDecode(response.body)['data'] != null) {
  //     String data = response.body;
  //     print(data);
  //     var aipToken = jsonDecode(data)['data']['api_personal_access_token'];
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('You are login')));
  //     print(aipToken);
  //   }

  //   if (response.statusCode == 200 &&
  //       (jsonDecode(response.body)['message'] != null)) {
  //     print(response.statusCode);
  //     String msg = response.body;
  //     var err = jsonDecode(msg)['message'];
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
  //     print(msg);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print('build called');

    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(children: <Widget>[

            const SizedBox(
              height: 40,
            ),
            buildPhone(),
            const SizedBox(
              height: 40,
            ),
          ]),
          const SizedBox(
            height: 225,
          ),
          Column(
            children: [
              const SizedBox(height: 20),
              RaisedButtonPG(
                text: 'Verify',
                onPressedHandler: () {
                  _saveForm();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildPhone() => TextFormField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'xxx-xxx-xxxx',
          hintStyle: kInputHintTextStyle,
          errorStyle: kErrorTextStyle,
          labelText: 'Phone *',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFFB8D1C),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.phone,
              color: Color(0xFFFB8D1C),
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                color: Color(0xFFFB8D1C),
              )),
        ),
        style: kInputTextStyle,
        keyboardType: TextInputType.phone,
        focusNode: _phoneFocusNode,
        onSaved: (value) {
          _phone = value!;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a phone number';
          }
          if (!phoneRegex.hasMatch(value)) {
            return 'Please enter a valid phone number xxx-xxx-xxxx';
          }
          return null;
        },
      );
}
