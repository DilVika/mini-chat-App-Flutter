import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/models/message_service_mode.dart';
import '../services/models/user_service_model.dart';
import '../utils/value_objects/value_objects.dart';

abstract class IFirebaseService {
  Future<DataResult<UserServiceModel>> loginGoogle();

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
  Future<DataResult<UserServiceModel>> loginGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Sign in aborted
    if (googleUser == null) {
      return DataResult.failure(SignInFailure());
    }

    GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // User? firebaseUser =
    //     (await FirebaseAuth.signInWithCredential(credential)).user;
  }
}
