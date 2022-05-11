import '../../utils/value_objects/value_objects.dart';
import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<DataResult<List<MessageEntity>>> getOlderMessages(
      String lastestMessageId);

  Future<DataResult<List<MessageEntity>>> getLastestMessages();

  Future<DataResult<void>> sendMessage(MessageEntity message);
}
