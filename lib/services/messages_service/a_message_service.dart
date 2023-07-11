import 'package:flash_chat/models/message.dart';

abstract class AMessageService {
  /// Add new message with sender to the db
  void add(Message message);
}
