import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Color colour;
  final VoidCallback onTapped;

  AuthButton({
    super.key,
    required this.text,
    required this.colour,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTapped,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
