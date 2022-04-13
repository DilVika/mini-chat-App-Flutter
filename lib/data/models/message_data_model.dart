import 'package:mini_chat_app_flutter/domains/entities/message_entity.dart';

class MessageDataModel extends MessageEntity {
  MessageDataModel(int id, String? body, DateTime? createdAt)
      : super(id, body, createdAt);
}
