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

class ChatLoadedState extends ChatPageState {
  final List<MessageModel> messages;

  ChatLoadedState(this.messages);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChatErrorState extends ChatPageState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
