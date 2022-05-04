part of 'chat_page_bloc.dart';

/// Chat (send messages, get new messages, etc) State
///
abstract class ChatPageState extends NerdChatState {}

class ChatInitial extends ChatPageState {



  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatLoading extends ChatPageState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatLoaded extends ChatPageState {
  final List<MessageModel> messages;

  ChatLoaded(this.messages);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatError extends ChatPageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
