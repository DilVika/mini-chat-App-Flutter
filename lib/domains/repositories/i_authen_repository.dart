import 'package:mini_chat_app_flutter/domains/entities/user_entity.dart';

import '../../utils/value_objects/value_objects.dart';

abstract class IAuthenRepository {
  Future<DataResult<UserEntity>> signIn();
}
