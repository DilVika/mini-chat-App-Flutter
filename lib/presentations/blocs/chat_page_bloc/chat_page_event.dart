part of 'chat_page_bloc.dart';

abstract class ChatPageEvent {}

class SendMessage extends ChatPageEvent {
  final MessageModel message;

  SendMessage(this.message);
}
