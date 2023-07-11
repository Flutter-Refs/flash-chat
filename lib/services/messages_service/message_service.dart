import 'package:flash_chat/data_access/firestore_service/firestore_service.dart';
import 'package:flash_chat/models/message.dart';
import 'package:flash_chat/services/messages_service/a_message_service.dart';

class MessageService extends AMessageService {
  static const String _collectionName = 'messages';

  final FirestoreService _data = FirestoreService();

  void add(Message message) {
    try {
      _data.add(_collectionName, {
        'text': message.text,
        'sender': message.sender,
      });
    } catch (e) {
      print(e);
    }
  }
}
