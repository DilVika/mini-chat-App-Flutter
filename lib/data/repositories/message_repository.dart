import '../models/message_data_model.dart';
import '/domains/repositories/i_message_repository.dart';
import '/services/services.dart';

/// Implement the [IMessageRepository] class.
class MessageRepository implements IMessageRepository {
  // Data provider source from services.
  final IHttpService _httpService;
  final ILocalService _localService;

  MessageRepository(this._httpService, this._localService);

  @override
  Future<List<MessageDataModel>> getMessages() {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
}
