import 'models/message_service_mode.dart';

abstract class IHttpService {
  // get messages by id
  Future<List<MessageServiceModel>> getMessages(String id);
}

class HttpService implements IHttpService {
  @override
  Future<List<MessageServiceModel>> getMessages(String id) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
}
