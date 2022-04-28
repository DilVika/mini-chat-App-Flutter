import 'package:mini_chat_app_flutter/domains/entities/message_entity.dart';

import '../../utils/object_values/data_result.dart';
import '../repositories/i_message_repository.dart';
import '/extensions/extensions.dart';

class SendMessageUsecase {
  final MessageEntity message;

  SendMessageUsecase(this.repository, this.message);

  final IMessageRepository repository;

  Future<DataResult<void>> execute(MessageEntity request) async {
    return await repository.sendMessage(request);
  }
}
