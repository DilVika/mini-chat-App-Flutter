import 'models/message_service_mode.dart';

abstract class ILocalService {
  // get messages by id
  Future<List<MessageServiceModel>> getMessages(String id);
}

class LocalService implements ILocalService {
  @override
  Future<List<MessageServiceModel>> getMessages(String id) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
}
