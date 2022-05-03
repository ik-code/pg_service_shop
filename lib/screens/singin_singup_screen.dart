import 'package:flutter/material.dart';
import 'package:playground_shop/screens/singin_to_account_screen.dart';
import 'package:playground_shop/widgets/logo_pg.dart';
import 'package:playground_shop/widgets/outlinebutton_pg.dart';
import 'package:playground_shop/widgets/raisedbutton_pg.dart';

import '../utilities/constants.dart';

class SingInSingUpScreen extends StatelessWidget {
  const SingInSingUpScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Expanded( 
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const<Widget>[
                SizedBox(height: 60,),
                LogoPG(imgFile:'playground_logo_orange.png'),
              ]) ,)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                OutlineButtonPG(text: 'Sign in', onPressedHandler: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SinginToAccountScreen()),
                      );
                }),
                const SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  child: 
                  const Text(
                    'or',
                    style: kSmallTextStyle,
                    ),
                ),
                 const SizedBox(height: 16,),
                 RaisedButtonPG(text: 'Sing up', onPressedHandler: (){

                 }),
                 const SizedBox(height: 32,),
              ],
            )
          ],
        ),
        )
    );
  }
}
