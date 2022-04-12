import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<List<MessageEntity>> getMessages();
}
