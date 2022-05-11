import '../../utils/value_objects/value_objects.dart';
import '../entities/message_entity.dart';
import '../repositories/i_message_repository.dart';

class GettMessagesUsecase {
  final IMessageRepository _messageRepository;

  final String? lastestMessageId;

  GettMessagesUsecase(this._messageRepository, this.lastestMessageId);

  Future<DataResult<List<MessageEntity>>> execute() async {
    if (lastestMessageId == null || lastestMessageId!.isEmpty) {
      return await _messageRepository.getLastestMessages();
    } else {
      return await _messageRepository.getOlderMessages(lastestMessageId!);
    }
  }
}
