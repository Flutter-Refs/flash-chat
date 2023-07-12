import 'package:flash_chat/models/message.dart';
import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  final Message message;
  final bool isCurrentUser;

  MessageBuble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isCurrentUser //
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          // sender
          Text(
            message.sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 5,
          ),

          // message
          Material(
            borderRadius: _borderRadius,
            elevation: 5,
            color: isCurrentUser //
                ? Colors.lightBlueAccent
                : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message.text,
                style: TextStyle(
                  color: isCurrentUser //
                      ? Colors.white
                      : Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BorderRadius get _borderRadius => isCurrentUser //
      ? BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        )
      : BorderRadius.only(
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        );
}
