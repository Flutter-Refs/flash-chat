// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flash_chat/utilities/constants.dart';
import 'package:flash_chat/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Logo
            Hero(
              tag: kHeroImageTag,
              child: Container(
                height: 200.0,
                child: Image.asset('lib/assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),

            // Email
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),

            // Password
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),

            // Register btn
            AuthButton(
              text: 'Register',
              colour: Colors.blueAccent,
              onTapped: () {
                // implement registration functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}
