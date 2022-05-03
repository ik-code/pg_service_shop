import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground_shop/config/api_connection.dart';
import 'package:playground_shop/screens/forgot_pass/forgot_pass_second/test_forgot_pass_second_screen.dart';

import 'package:playground_shop/utilities/constants.dart';
import 'package:playground_shop/widgets/logo_pg.dart';

import 'package:playground_shop/widgets/raisedbutton_pg.dart';

import 'package:http/http.dart' as http;

import '../screens/forgot_pass/forgot_pass_second/forgot_pass_numeric_pad_second_screen.dart';
import '../screens/reset_password_third_screen.dart';

class ForgotPassPhoneForm extends StatefulWidget {
  const ForgotPassPhoneForm({Key? key}) : super(key: key);

  @override
  State<ForgotPassPhoneForm> createState() => _ForgotPassPhoneFormState();
}

class _ForgotPassPhoneFormState extends State<ForgotPassPhoneForm> {
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
                      Row(
                        children: [
                          IconButton(
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: [
                                  Color(0xFFFEFBDA),
                                  Color(0xFFFEE9D2),
                                ]),
                              ),
                              child: const Icon(Icons.arrow_back),
                            ),
                            iconSize: 24,
                            color: const Color(0xFF212121),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Forgot Password',
                            style: kBigtitleTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      const Text('Enters valid Phone number to get SMS',
                          textAlign: TextAlign.center,
                          style: kSubtitleOrangeTextStyle),
                                                const SizedBox(
                        height: 32,
                      ),
            buildPhone(),
            const SizedBox(
              height: 40,
            ),
          ]),
          const SizedBox(
            height: 300,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              RaisedButtonPG(
                text: 'Send SMS Code',
                onPressedHandler: () {
                  _saveForm();
                  print((RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$'))
                      .hasMatch(_phone));
                  if ((RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$'))
                      .hasMatch(_phone)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ForgotPassNumericPadSecondScreen(
                                  phoneNumber: _phone)),
                    );
                  }
                },
              ),
                const SizedBox(height: 50),
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
