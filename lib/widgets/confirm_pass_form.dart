import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground_shop/config/api_connection.dart';
import 'package:playground_shop/screens/congrats_screen.dart';
import 'package:playground_shop/screens/forgot_pass/forgot_pass_first_screen.dart';
import 'package:playground_shop/utilities/constants.dart';
import 'package:playground_shop/widgets/logo_pg.dart';
import 'package:playground_shop/widgets/raisedbutton_pg.dart';

import 'package:http/http.dart' as http;

class ConfirtmPastForm extends StatefulWidget {
  const ConfirtmPastForm({Key? key}) : super(key: key);

  @override
  State<ConfirtmPastForm> createState() => _ConfirtmPastFormState();
}

class _ConfirtmPastFormState extends State<ConfirtmPastForm> {
  final _formKey = GlobalKey<FormState>();
  //String _phone = '';
  String _password = '';
  String _password2 = '';
  bool _isPasswordVisible = true;
  bool _isPasswordVisible2 = true;

  final _passwordFocusNode = FocusNode();
  final _passwordFocusNode2 = FocusNode();

  //final RegExp phoneRegex = RegExp(r'^[0-9]{3}-[0-9]{3}-[0-9]{4}$');

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
    _passwordFocusNode2.dispose();
    // _phoneFocusNode.dispose();

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
    // print('Phone: ${_phone}');
    print('Password: ${_password}');
    print('Password: ${_password2}');

    getData();
  }

  void getData() async {
    // ApiConnection apiConnection =
    //     ApiConnection(password: _password, password2: _password2);

    // http.Response response = await http.post(apiConnection.logInPostEndPoint());

    // if (response.statusCode == 200 &&
    //     jsonDecode(response.body)['data'] != null) {
    //   String data = response.body;
    //   print(data);
    //   var aipToken = jsonDecode(data)['data']['api_personal_access_token'];
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('You are login')));
    //   print(aipToken);
    // }

    // if (response.statusCode == 200 &&
    //     (jsonDecode(response.body)['message'] != null)) {
    //   print(response.statusCode);
    //   String msg = response.body;
    //   var err = jsonDecode(msg)['message'];
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err)));
    //   print(msg);
    // }
  }

  @override
  Widget build(BuildContext context) {
    print('build called');

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(children: <Widget>[
              buildPassword(),
              const SizedBox(
                height: 40,
              ),
              buildPassword2(),
            ]),
            const SizedBox(
              height: 140,
            ),
            Column(
              children: [
                const SizedBox(height: 180),
                RaisedButtonPG(
                  text: 'Save',
                  onPressedHandler: () {
                    if (_password.isEmpty || _password2.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'Please fill up fields password and cofirm password')));
                      print('Please enter password');
                    }
                    if (_password != _password2) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Fields password and confirm password don't match")));
                      print("Fields password and confirm password don't match");
                    }
                    if ((_password.isNotEmpty && _password2.isNotEmpty) &&
                        _password == _password2) {
                      print('${_password}');
                      print('${_password2}');

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CongratsScreen()),
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildPassword() => TextFormField(
        onChanged: (value) => setState(() => _password = value),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Password',
          labelText: 'Password *',
          hintStyle: kInputHintTextStyle,
          errorStyle: kErrorTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFFB8D1C),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: _isPasswordVisible
                ? const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFFB8D1C),
                  )
                : const Icon(Icons.visibility, color: Color(0xFFFB8D1C)),
            onPressed: () =>
                setState(() => _isPasswordVisible = !_isPasswordVisible),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: kInputTextStyle,
        obscureText: _isPasswordVisible,
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode,
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          return null;
        },
        onSaved: (value) {
          _password = value!;
        },
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(_passwordFocusNode2);
        },
      );

  Widget buildPassword2() => TextFormField(
        onChanged: (value) => setState(() => _password2 = value),
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _passwordFocusNode2.hasFocus
                ? const Color(0xFF898A8D)
                : const Color(0xFF898A8D),
            fontFamily: 'Manrope',
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          hintText: 'Confirm Password',
          labelText: 'Confirm Password *',
          hintStyle: kInputHintTextStyle,
          errorStyle: kErrorTextStyle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xFFFB8D1C),
              width: 2.0,
            ),
          ),
          suffixIcon: IconButton(
            icon: _isPasswordVisible2
                ? const Icon(
                    Icons.visibility_off,
                    color: Color(0xFFFB8D1C),
                  )
                : const Icon(Icons.visibility, color: Color(0xFFFB8D1C)),
            onPressed: () =>
                setState(() => _isPasswordVisible2 = !_isPasswordVisible2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        style: kInputTextStyle,
        obscureText: _isPasswordVisible2,
        keyboardType: TextInputType.text,
        focusNode: _passwordFocusNode2,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please confirm a password';
          }
          return null;
        },
        onSaved: (value) {
          _password2 = value!;
        },
        onFieldSubmitted: (_) {},
      );
}
