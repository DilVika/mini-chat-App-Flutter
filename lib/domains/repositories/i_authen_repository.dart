import 'package:mini_chat_app_flutter/domains/entities/user_entity.dart';

import '../../utils/object_values/data_result.dart';
import '../entities/message_entity.dart';

abstract class IAuthenRepository {
  Future<DataResult<UserEntity>> signIn();
}
