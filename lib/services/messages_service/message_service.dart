import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/messages_service/a_message_service.dart';

class MessageService extends AMessageService {
  final FirebaseFirestore _data = FirebaseFirestore.instance;
  static const String _collectionName = 'messages';

  void add(Message message) {
    try {
      this._data.collection(_collectionName).add({
        'text': message.text,
        'sender': message.sender,
        'timeStamp': message.timeStamp,
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<Message>> fetchAll() {
    return _data.collection(_collectionName).orderBy("timeStamp", descending: true).snapshots().map((snapshot) {
      return snapshot.docs.map((document) {
        final data = document.data();
        final text = data.containsKey('text') //
            ? data['text'] as String
            : '';
        final sender = data.containsKey('sender') //
            ? data['sender'] as String
            : '';
        return Message(text: text, sender: sender);
      }).toList();
    });
  }
}
