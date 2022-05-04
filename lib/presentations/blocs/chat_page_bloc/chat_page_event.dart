part of 'chat_page_bloc.dart';

abstract class ChatPageEvent {}

class ChatInitialed extends ChatPageEvent {}

class SendMessage extends ChatPageEvent {
  final MessageModel message;

  SendMessage(this.message);
}

class GetOlderMessages extends ChatPageEvent {
  final int lastestMessageId;

  GetOlderMessages(this.lastestMessageId);
}
