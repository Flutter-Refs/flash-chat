import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/pages/login_screen.dart';
import 'package:flash_chat/services/authentication_service/authentication_service.dart';
import 'package:flash_chat/services/messages_service/message_service.dart';
import 'package:flash_chat/widgets/messages_stream.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final MessageService _messageService = MessageService();
  final TextEditingController messageTextController = TextEditingController();
  final AuthenticationService _auth = AuthenticationService();
  late User _loggedInUser;
  late String message;

  @override
  void initState() {
    super.initState();
    _loggedInUser = _auth.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          // Logout btn
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              this._auth.logout();
              Navigator.pushNamed(context, LoginScreen.route);
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // List messages
            MessagesStream(),
            // Send message field & btn
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Send message field
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),

                  // Send message btn
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      this._messageService.add(
                            Message(
                              text: message,
                              sender: _loggedInUser.email as String,
                            ),
                          );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
