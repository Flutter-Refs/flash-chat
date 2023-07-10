// ignore_for_file: prefer_const_constructors

import 'package:flash_chat/pages/chat_screen.dart';
import 'package:flash_chat/pages/login_screen.dart';
import 'package:flash_chat/pages/registration_screen.dart';
import 'package:flash_chat/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        LoginScreen.route: (context) => LoginScreen(),
        RegistrationScreen.route: (context) => RegistrationScreen(),
        ChatScreen.route: (context) => ChatScreen(),
      },
    );
  }
}
