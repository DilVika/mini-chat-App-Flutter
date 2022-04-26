import 'dart:html';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/message_model.dart';
import '../base_bloc/base_bloc_index.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatPageBloc() : super(ChatPageInitial());

  @override
  Stream<ChatPageState> mapEventToState(ChatPageEvent event) async* {
    if (event is SendMessage) {
      yield ChatPageLoaded([]);
    }
  }
}
