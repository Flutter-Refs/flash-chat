// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flash_chat/pages/chat_screen.dart';
import 'package:flash_chat/services/authentication_service/authentication_service.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flash_chat/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String route = 'registration_screen';

  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final AuthenticationService _authService = AuthenticationService();
  String email = '';
  String password = '';
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
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
                textAlign: TextAlign.center,
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

              // Register btn
              AuthButton(
                text: 'Register',
                colour: Colors.blueAccent,
                onTapped: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  if (await _authService.register(email, password)) {
                    Navigator.pushNamed(context, ChatScreen.route);
                  }

                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
