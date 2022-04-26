part of 'chat_page_bloc.dart';

/// Chat (send messages, get new messages, etc) State
///
abstract class ChatPageState extends NerdChatState {}

class ChatPageInitial extends ChatPageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatPageLoading extends ChatPageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatPageLoaded extends ChatPageState {
  final List<MessageModel> messages;

  ChatPageLoaded(this.messages);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
