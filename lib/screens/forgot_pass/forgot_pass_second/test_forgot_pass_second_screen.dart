import 'package:flutter/material.dart';

import './numeric_pad.dart';

import '../../../utilities/constants.dart';


class ForgotPassSecondScreen extends StatefulWidget {

 String phoneNumber = '';

  ForgotPassSecondScreen({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  State<ForgotPassSecondScreen> createState() => _ForgotPassSecondScreenState();
}

class _ForgotPassSecondScreenState extends State<ForgotPassSecondScreen> {
 
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
              const Text(
                'Code has been send to  123-123-1234',
                style: kSubtitleOrangeTextStyle,
              ),
              const SizedBox(
                height: 5,
              ),

            
              
            ],
          ),
        ),
      ),
    );
  }
}
