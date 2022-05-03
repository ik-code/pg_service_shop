import 'package:flutter/material.dart';
import 'package:playground_shop/screens/reset_password_third_screen.dart';
import 'package:playground_shop/widgets/raisedbutton_pg.dart';
import '../../../utilities/constants.dart';
import './numeric_pad.dart';

class ForgotPassNumericPadSecondScreen extends StatefulWidget {
  String phoneNumber = '';

  ForgotPassNumericPadSecondScreen({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  State<ForgotPassNumericPadSecondScreen> createState() => _ForgotPassNumericPadSecondScreenState();
}

class _ForgotPassNumericPadSecondScreenState extends State<ForgotPassNumericPadSecondScreen> {
  String code = '';

  @override
  void initState() {
    super.initState();
    print(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
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
                      Text('Code is sent to ' + widget.phoneNumber,
                          textAlign: TextAlign.center,
                          style: kSubtitleOrangeTextStyle),
                                                const SizedBox(
                        height: 32,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BuildCodeNumericBox(
                              code.length > 0 ? code.substring(0, 1) : ''),
                          BuildCodeNumericBox(
                              code.length > 1 ? code.substring(1, 2) : ''),
                          BuildCodeNumericBox(
                              code.length > 2 ? code.substring(2, 3) : ''),
                          BuildCodeNumericBox(
                              code.length > 3 ? code.substring(3, 4) : ''),
                        ],
                      ),
                                                                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Didn't recive code?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8C8C8C),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Resend the code to the user");
                            },
                            child: const Text(
                              'Request again',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFB8D1C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButtonPG(
                  text: 'Verify Account',
                  onPressedHandler: () {
                    if (code.isNotEmpty && code.length == 4) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ResetPasswordThirdScreen()),
                      );
                      print(code);
                      print('Verify Account');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please enter a SMS code')));
                      print('Please enter a SMS code');
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                NumericPad(
                  onNumberSelected: (value) {
                    setState(() {
                      if (value != -1) {
                        if (code.length < 4) {
                          code = code + value.toString();
                        }
                      } else {
                        code = code.substring(0, code.length - 1);
                      }
                    });

                    print(value);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget BuildCodeNumericBox(String codeNumber) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 78,
        height: 64,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFF6F5FA),
              border: Border.all(
                width: 1,
                color: const Color(0xFFFB8D1C),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Color(0xFFD4D4D4),
                  blurRadius: 75.0,
                  spreadRadius: 5,
                  offset: Offset(0.0, 0.0),
                ),
              ]),
          child: Center(
            child: Text(
              codeNumber,
              style: const TextStyle(
                fontFamily: 'Manrope',
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Color(0xFF212121),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
