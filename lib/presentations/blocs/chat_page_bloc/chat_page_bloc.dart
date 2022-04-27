import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/message_model.dart';
import '../base_bloc/base_bloc_index.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc() : super(ChatInitial());

  @override
  Stream<ChatPageState> mapEventToState(ChatPageEvent event) async* {
    if (event is SendMessage) {
      _handleInitial();
    }
  }

  Stream<ChatPageState> _handleInitial() async* {
    yield ChatInitial();
    var messages = await _mockData();

    if (messages != null) {
      yield ChatLoadedState(messages);
    } else if (messages == null) {
      yield ChatErrorState();
    }
  }

  /// Return mock data, fake loading.
  Future<List<MessageModel>> _mockData() async {
    final messages = [
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie.",
          isRight: false,
          time: DateTime.now()),
      MessageModel(
          text: "Lorem ipsum dolor amet, consectetur.",
          isRight: true,
          time: DateTime.now()),
      MessageModel(text: "Consectetur", isRight: false, time: DateTime.now()),
      MessageModel(text: "ipsum .", isRight: true, time: DateTime.now())
    ];
    await Future.delayed(Duration(seconds: 1));

    return messages;
  }
}
