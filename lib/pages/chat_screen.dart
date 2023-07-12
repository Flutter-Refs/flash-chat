import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/pages/login_screen.dart';
import 'package:flash_chat/services/authentication_service/authentication_service.dart';
import 'package:flash_chat/services/messages_service/message_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/utilities/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String route = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final AuthenticationService _auth = AuthenticationService();
  final MessageService _messageService = MessageService();

  late User _loggedInUser;
  String message = '';

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
            StreamBuilder<List<Message>>(
              stream: _messageService.fetchAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  // Display a loading indicator if the snapshot is not yet complete or there is no data
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Display an error message if an error occurred
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the messages
                  final messages = snapshot.data!;
                  return Column(
                    children: messages.map((msg) => Text('${msg.text} from ${msg.sender}')).toList(),
                  );
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Send message field
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),

                  // Send message btn
                  TextButton(
                    onPressed: () {
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
