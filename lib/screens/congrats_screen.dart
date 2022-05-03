import 'package:flutter/material.dart';
import 'package:playground_shop/widgets/logo_pg.dart';
import '../utilities/constants.dart';
import '../widgets/raisedbutton_pg.dart';
import '../widgets/signin_form.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({Key? key}) : super(key: key);

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
                  child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    LogoPG(
                      imgFile: 'logo_orange_final_screen.png',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Congrats!',
                      style: kBigtitleTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Create a new password',
                      style: kSubtitleBlackTextStyle,
                    ),
                     SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )),
              RaisedButtonPG(
                text: 'Go to Home Page',
                onPressedHandler: () {
                  print('Go to Home Page');
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
