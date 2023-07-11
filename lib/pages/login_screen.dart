// ignore_for_file: prefer_const_constructors, library_private_types_in_public_apilogo.png

import 'package:flash_chat/pages/chat_screen.dart';
import 'package:flash_chat/services/authentication_service.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flash_chat/widgets/auth_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String route = 'login_screen';

  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthenticationService _auth = AuthenticationService();
  String email = '';
  String password = '';

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
                email = value;
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
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 24.0,
            ),

            // Login btn
            AuthButton(
              text: 'Log in',
              colour: Colors.blueAccent,
              onTapped: () async {
                if (await this._auth.login(email, password)) {
                  Navigator.pushNamed(context, ChatScreen.route);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
