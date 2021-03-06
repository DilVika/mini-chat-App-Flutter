import '../../utils/value_objects/value_objects.dart';
import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<DataResult<List<MessageEntity>>> getOlderMessages(
      String earliestMessageId);
  Future<DataResult<List<MessageEntity>>> getLastestChatMessages(String? lastestMessageId);

    Future<DataResult<List<MessageEntity>>> getLastestMessagesById();

  Future<DataResult<void>> sendMessage(MessageEntity message);
}

