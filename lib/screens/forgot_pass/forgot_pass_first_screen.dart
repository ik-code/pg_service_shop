import 'package:flutter/material.dart';
import 'package:playground_shop/widgets/forgot_pass_phone_form.dart';

class ForgotPassFirstScreen extends StatefulWidget {
  const ForgotPassFirstScreen({ Key? key }) : super(key: key);

  @override
  State<ForgotPassFirstScreen> createState() => _ForgotPassFirstScreenState();
}

class _ForgotPassFirstScreenState extends State<ForgotPassFirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(child: const ForgotPassPhoneForm()),
          ),
      )
    );
  }
}