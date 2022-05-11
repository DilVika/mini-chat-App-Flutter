import 'package:mini_chat_app_flutter/domains/entities/message_entity.dart';

import '../../utils/value_objects/value_objects.dart';
import '/domains/repositories/i_message_repository.dart';
import '/services/services.dart';

/// Implement the [IMessageRepository] class.
class MessageRepository implements IMessageRepository {
  // Data provider source from services.
  final IHttpService _httpService;
  final ILocalService _localService;

  MessageRepository(this._httpService, this._localService);

  @override
  Future<DataResult<List<MessageEntity>>> getOlderMessages(
      String lastestMessageId) async {
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<MessageEntity>>> getLastestMessages() {
    // TODO: implement getLastestMessages
    throw UnimplementedError();
  }

  @override
  Future<DataResult<void>> sendMessage(MessageEntity message) {
    // TODO: implement sendMessage
    throw UnimplementedError();
  }
}
