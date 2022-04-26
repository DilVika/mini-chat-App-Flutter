import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/resources/resources.dart';

part 'chat_bubble.dart';

class ChatPageReal extends StatelessWidget {
  final String chatContact;

  const ChatPageReal({Key? key, required this.chatContact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('chat page real rebuild');
    final _theme = Theme.of(context);

    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: Dimensions.defaultSpacing,
      ),
      SafeArea(
        bottom: false,
        child: Row(
          children: [
            SizedBox(
              width: Dimensions.defaultPadding.left,
            ),
            Hero(
              tag: AnimationConstants.titleHeroTag,
              child: Text(
                UIConfigs.appName,
                style: _theme.textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: Dimensions.defaultVerticalPadding),
      Expanded(
        child: ChatSection(
          title: chatContact,
        ),
      )
    ]));
  }
}

class ChatSection extends StatefulWidget {
  final String title;
  const ChatSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  late List<_MessageModel> messages;
  final TextEditingController _textController = TextEditingController();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final ScrollController _scrollController = ScrollController();

  final lastKey = GlobalKey();

  //init state
  @override
  void initState() {
    super.initState();

//TODO: Mock Messages
    messages = [
      _MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      _MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      _MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      _MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: DateTime.now()),
      _MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie.",
          isRight: false,
          time: DateTime.now()),
      _MessageModel(
          text: "Lorem ipsum dolor amet, consectetur.",
          isRight: true,
          time: DateTime.now()),
      _MessageModel(text: "Consectetur", isRight: false, time: DateTime.now()),
      _MessageModel(text: "ipsum .", isRight: true, time: DateTime.now())
    ];
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      // setState(() {
      messages.insert(
          0,
          _MessageModel.fromNow(
            text: _textController.text,
            isRight: true,
          ));

      _listKey.currentState?.insertItem(0);

// Get the full content height.
// final contentSize = _scrollController.position.viewportDimension + _scrollController.position.maxScrollExtent;
// // Index to scroll to.
// final index = messages.length;
// // Estimate the target scroll position.
// final target = contentSize * index / messages.length;
// Scroll to that position.

      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        // (lastKey.currentContext?.size?.height ?? 0),
        curve: Curves.easeOut,
        duration: AnimationConstants.defaultScrollDuration,
      );

      _textController.clear();
      // });
    }
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('chat section rebuild');
    final _theme = Theme.of(context);

    return Hero(
      tag: widget.title,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          padding:
              const EdgeInsets.fromLTRB(24, Dimensions.defaultSpacing, 26, 0),
          decoration: BoxDecoration(
            color: _theme.colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(Dimensions.messageBubbleRadius),
              topRight: Radius.circular(Dimensions.messageBubbleRadius),
            ),
            boxShadow: [
              AppStyles.defaultBoxShadow(context),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Dimensions.defaultIconSize,
                      height: Dimensions.defaultIconSize,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: _theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: Dimensions.defaultSpacing),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: _theme.textTheme.headlineMedium?.copyWith(
                          color: _theme.colorScheme.primary,
                          fontSize: Dimensions.defaultIconSize,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 10,
                child: AnimatedList(
                  key: _listKey,
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  initialItemCount: messages.length,
                  reverse: true,
                  itemBuilder: (c, i, animation) {
                    var showProfileBox = true;
                    if (i != 0) {
                      var currentChat = messages[i];
                      var previousChat = messages[i - 1];
                      showProfileBox =
                          currentChat.isRight != previousChat.isRight;
                    }
                    return Builder(builder: (context) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 10),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(
                            parent: animation, curve: Curves.easeOut)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: (((i + 1) < messages.length) &&
                                      messages[i].isRight !=
                                          messages[i + 1].isRight)
                                  ? Dimensions.messageBubbleExternalPadding
                                  : Dimensions.messageBubbleInternalPadding),
                          child: _ChatBubble(
                            key: messages.length == i + 1 ? lastKey : null,
                            chat: messages[i],
                            showProfileBox: showProfileBox,
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              //Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 9, bottom: 9),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.greyC4,
                ),
                child: Row(
                  children: [
                    const SizedBox(width: Dimensions.defaultIconSize),
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: "Aa",
                          isDense: true,
                          filled: true,
                          fillColor: AppColors.greyC4,
                          focusedBorder: AppStyles.focusedTransparentBorder,
                          disabledBorder: AppStyles.focusedTransparentBorder,
                          enabledBorder: AppStyles.focusedTransparentBorder,
                          errorBorder: AppStyles.focusedTransparentBorder,
                          focusedErrorBorder:
                              AppStyles.focusedTransparentBorder,
                          errorStyle: errorTextStyle(context),
                        ),
                        onSubmitted: (value) {
                          // Check which focus node is focused
                          // Print submited notification to console
                          print('submited: ${_textController.text}');
                          _sendMessage();
                        },
                      ),
                    ),
                    Container(
                      width: Dimensions.sendButtonSize,
                      height: Dimensions.sendButtonSize,
                      margin: const EdgeInsets.all(
                          Dimensions.buttonExtraSmallPaddingSize),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.largeRadius),
                      ),
                      child: SizedBox(
                        width: Dimensions.defaultIconSize,
                        height: Dimensions.defaultIconSize,
                        child: CupertinoButton.filled(
                          borderRadius:
                              BorderRadius.circular(Dimensions.largeRadius),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            print('send button pressed');
                            _sendMessage();
                          },
                          child: const Icon(
                            Icons.send,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatModel {
  final int chatId;
  final UserModel sender;
  final UserModel receiver;
  final _MessageModel message;
  final String sentAt;

  _ChatModel(
      this.chatId, this.sender, this.receiver, this.message, this.sentAt);
}

class UserModel {
  final int userId;

  UserModel(this.userId);
}

class _MessageModel {
  final String text;

  final MessageStatus status;

  /// if time is null, then set to now time.
  final DateTime time;
  final bool isRight;

  final _dateFormat = DateFormat('HH:mm');

  String get timeString => _dateFormat.format(time);

  _MessageModel({
    required this.text,
    required this.time,
    this.status = MessageStatus.sent,
    required this.isRight,
  });

  _MessageModel.fromNow({
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
