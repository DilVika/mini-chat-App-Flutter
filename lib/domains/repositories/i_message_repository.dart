import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<List<MessageEntity>> getOlderMessages(String lastestMessageId);

  Future<List<MessageEntity>> getLastestMessages();

  Future<void> sendMessage(MessageEntity message);
}
