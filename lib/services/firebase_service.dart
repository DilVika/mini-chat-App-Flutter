import 'package:mini_chat_app_flutter/services/models/message_service_mode.dart';
import 'package:mini_chat_app_flutter/services/models/user_service_model.dart';
import 'package:mini_chat_app_flutter/utils/object_values/data_result.dart';

abstract class IFirebaseService {
  Future<DataResult<UserServiceModel>> login();

  Future<DataResult<List<MessageServiceModel>>> fetchMessages(String chatId);

  Future<DataResult<List<MessageServiceModel>>> fetchChatList(String userId);

  Future<DataResult<List<UserServiceModel>>> fetchUserList();
}

class FirebaseService implements IFirebaseService {
  @override
  Future<DataResult<List<MessageServiceModel>>> fetchChatList(String userId) {
    // TODO: implement fetchChatList
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<MessageServiceModel>>> fetchMessages(String chatId) {
    // TODO: implement fetchMessages
    throw UnimplementedError();
  }

  @override
  Future<DataResult<List<UserServiceModel>>> fetchUserList() {
    // TODO: implement fetchUserList
    throw UnimplementedError();
  }

  @override
  Future<DataResult<UserServiceModel>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

}