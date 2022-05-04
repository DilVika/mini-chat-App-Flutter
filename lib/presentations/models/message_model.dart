import 'package:intl/intl.dart';

import '../../resources/resources.dart';

class MessageModel {
  final String? id;
  final String text;

  final MessageStatus status;

  /// if time is null, then set to now time.
  final DateTime time;
  final bool isRight;

  final _dateFormat =  DateConstants.dateFormatter;

  String get timeString => _dateFormat.format(time);

  MessageModel({
    this.id,
    required this.text,
    required this.time,
    this.status = MessageStatus.sent,
    required this.isRight,
  });

  MessageModel.fromNow({
    this.id,
    required this.text,
    required this.isRight,
  })  : time = DateTime.now(),
        status = MessageStatus.sending;
}

enum MessageStatus {
  sending,
  sent,
  failed,
}
