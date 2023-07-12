import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/authentication_service/authentication_service.dart';
import 'package:flash_chat/services/messages_service/message_service.dart';
import 'package:flash_chat/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  final MessageService _messageService = MessageService();
  final AuthenticationService _auth = AuthenticationService();

  MessagesStream({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
      stream: _messageService.fetchAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
          // Display a loading indicator if the snapshot is not yet complete or there is no data
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          // Display an error message if an error occurred
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          var currentUserEmail = _auth.getCurrentUser().email;
          // Display the messages
          final messages = snapshot.data!;
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messages //
                  .map((msg) => MessageBuble(
                        message: msg,
                        isCurrentUser: msg.sender == currentUserEmail,
                      ))
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
