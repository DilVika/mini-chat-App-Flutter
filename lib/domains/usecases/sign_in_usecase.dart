import 'package:mini_chat_app_flutter/domains/entities/user_entity.dart';
import 'package:mini_chat_app_flutter/domains/usecases/usecase.dart';
import 'package:mini_chat_app_flutter/utils/object_values/data_result.dart';

import '../repositories/i_message_repository.dart';

class SignInUsecase extends Usecase {
  final UserEntity user;

  final IMessageRepository repository;

  SignInUsecase(this.user, this.repository);

  @override
  Future<DataResult<void>> execute() async {
    return await repository.signIn(user);
  }
}
