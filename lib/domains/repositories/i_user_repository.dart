import 'package:mini_chat_app_flutter/domains/entities/user_entity.dart';

import '../../utils/value_objects/value_objects.dart';

abstract class IUserRepository {
  Future<DataResult<UserEntity>> login();
  Future<DataResult<UserEntity>> logout();
  Future<DataResult<UserEntity>> getUserInforById();

}
