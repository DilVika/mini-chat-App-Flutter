import '../../utils/object_values/data_result.dart';
import '../entities/message_entity.dart';

abstract class IMessageRepository {
  Future<DataResult<List<MessageEntity>>> getOlderMessages(
      String lastestMessageId);

  Future<DataResult<List<MessageEntity>>> getLastestMessages();

  Future<DataResult<void>> sendMessage(MessageEntity message);
}
