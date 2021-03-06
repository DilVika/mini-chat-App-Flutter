import 'package:mini_chat_app_flutter/domains/entities/user_entity.dart';
import 'package:mini_chat_app_flutter/domains/repositories/i_user_repository.dart';

import '../../utils/value_objects/value_objects.dart';

class SignInUsecase {
  final UserEntity user;

  final IUserRepository repository;

  SignInUsecase(this.user, this.repository);

  Future<DataResult<UserEntity>> execute() async {
    return await repository.login();
  }
}
