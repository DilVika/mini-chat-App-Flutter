import '../entities/message_entity.dart';
import '../repositories/i_message_repository.dart';

class GettMessagesListUsecase {
  final IMessageRepository _messageRepository;

  final String? lastestMessageId;

  GettMessagesListUsecase(this._messageRepository, this.lastestMessageId);

  Future<List<MessageEntity>> execute() async {
    if (lastestMessageId == null || lastestMessageId!.isEmpty) {
      return await _messageRepository.getLastestMessages();
    } else {
      return await _messageRepository.getOlderMessages(lastestMessageId!);
    }
  }
}
