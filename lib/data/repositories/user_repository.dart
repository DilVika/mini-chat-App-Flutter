import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../../domains/entities/user_entity.dart';
import '../../domains/repositories/i_user_repository.dart';
import '../../utils/value_objects/value_objects.dart';

class UserRepository implements IUserRepository {
  @override
  Future<DataResult<UserEntity>> login()  async {
    // Firebase
    return _firebaseGoogleLogin();
  }


  @override
  Future<DataResult<UserEntity>> getUserInforById() {
    // TODO: implement getUserInfor
    throw UnimplementedError();
  }
  
  @override
  Future<DataResult<UserEntity>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

    Future<DataResult<UserEntity>> _firebaseGoogleLogin() async {
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

    User? firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    if (firebaseUser == null || firebaseUser.displayName == null) {
      return DataResult.failure(SignInFailure());
    }

    return DataResult.success(
      UserEntity(id: firebaseUser.uid, name: firebaseUser.displayName!),
    );
  }
  
}