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
