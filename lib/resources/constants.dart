import 'package:intl/intl.dart';

class AnimationConstants {
  static const defautTransitionDuration = Duration(milliseconds: 700);

  static const defaultScrollDuration = Duration(milliseconds: 300);

  static const titleHeroTag = 'title';
}

class DateConstants {
  static const chatTimeFormat = 'HH:mm';

  static final dateFormatter =  DateFormat(chatTimeFormat);

}


class FirestoreConstants {
  static const pathUserCollection = "users";
  static const pathMessageCollection = "messages";
  static const nickname = "nickname";
  static const aboutMe = "aboutMe";
  static const photoUrl = "photoUrl";
  static const id = "id";
  static const chattingWith = "chattingWith";
  static const idFrom = "idFrom";
  static const idTo = "idTo";
  static const timestamp = "timestamp";
  static const content = "content";
  static const type = "type";
}