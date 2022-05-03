import 'package:flutter/material.dart';

import '../widgets/signin_form.dart';

class SinginToAccountScreen extends StatelessWidget {
  const SinginToAccountScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const SigninForm(),
          ),
      )
    );
  }
}
