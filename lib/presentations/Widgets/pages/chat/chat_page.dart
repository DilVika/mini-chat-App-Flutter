import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/resources/resources.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<MessageModel> messages;
  final TextEditingController _textController = TextEditingController();

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  //init state
  @override
  void initState() {
    super.initState();

//TODO: Mock Messages
    messages = [
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
          isRight: false,
          time: "08:30"),
      MessageModel(
          text:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie.",
          isRight: false,
          time: "08:30"),
      MessageModel(
          text: "Lorem ipsum dolor amet, consectetur.",
          isRight: true,
          time: "08:30"),
      MessageModel(text: "Consectetur", isRight: false, time: "08:30"),
      MessageModel(text: "ipsum .", isRight: true, time: "08:30")
    ];
  }

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      // setState(() {
      messages.add(MessageModel(
          text: _textController.text,
          isRight: true,
          time: DateTime.now().hour.toString()));

      _listKey.currentState?.insertItem(messages.length - 1);
      _textController.clear();
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    'Nerd Chat',
                    style: _theme.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.defaultVerticalPadding),
          Expanded(
            child: Hero(
              tag: widget.title,
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      24, Dimensions.defaultSpacing, 26, 0),
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
                                style:
                                    _theme.textTheme.headlineMedium?.copyWith(
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
                      // const SizedBox(
                      //     height: Dimensions.messageBubbleInternalPadding),
                      Expanded(
                        flex: 10,
                        child: AnimatedList(
                          key: _listKey,
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          initialItemCount: messages.length,
                          itemBuilder: (c, i, animation) {
                            var showProfileBox = true;
                            if (i != 0) {
                              var currentChat = messages[i];
                              var previousChat = messages[i - 1];
                              showProfileBox =
                                  currentChat.isRight != previousChat.isRight;
                            }
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -1),
                                end: Offset.zero,
                              ).animate(animation),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: (((i + 1) < messages.length) &&
                                            messages[i].isRight !=
                                                messages[i + 1].isRight)
                                        ? Dimensions
                                            .messageBubbleExternalPadding
                                        : Dimensions
                                            .messageBubbleInternalPadding),
                                child: _ChatBubble(
                                  chat: messages[i],
                                  showProfileBox: showProfileBox,
                                ),
                              ),
                            );
                          },
                          // separatorBuilder: (BuildContext context, int index) {
                          //   if (messages[index].isRight !=
                          //       messages[index + 1].isRight) {
                          //     return const SizedBox(
                          //       height: Dimensions.messageBubbleExternalPadding,
                          //     );
                          //   } else {
                          //     // Different sender
                          //     return const SizedBox(
                          //       height: Dimensions.messageBubbleInternalPadding,
                          //     );
                          //   }
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
                                  focusedBorder:
                                      AppStyles.focusedTransparentBorder,
                                  disabledBorder:
                                      AppStyles.focusedTransparentBorder,
                                  enabledBorder:
                                      AppStyles.focusedTransparentBorder,
                                  errorBorder:
                                      AppStyles.focusedTransparentBorder,
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
                                borderRadius: BorderRadius.circular(
                                    Dimensions.largeRadius),
                              ),
                              child: SizedBox(
                                width: Dimensions.defaultIconSize,
                                height: Dimensions.defaultIconSize,
                                child: CupertinoButton.filled(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.largeRadius),
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
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final MessageModel chat;
  final bool showProfileBox;

  const _ChatBubble(
      {Key? key, required this.chat, required this.showProfileBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return chat.isRight
        ? Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  chat.time,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18, 13, 18, 12),
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.mediumRadius),
                            topRight: Radius.circular(Dimensions.mediumRadius),
                            bottomLeft:
                                Radius.circular(Dimensions.mediumRadius),
                          ),
                        ),
                        child: Text(
                          chat.text,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        : IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Visibility(
                  visible: showProfileBox,
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: Dimensions.profileBoxSize,
                      height: Dimensions.profileBoxSize,
                      color: theme.hoverColor,
                    ),
                  ),
                ),
                const SizedBox(width: 21),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(18, 13, 18, 12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.tertiary,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.mediumRadius),
                              topRight:
                                  Radius.circular(Dimensions.mediumRadius),
                              bottomRight:
                                  Radius.circular(Dimensions.mediumRadius),
                            ),
                          ),
                          child: Text(
                            chat.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: showProfileBox,
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          chat.time,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}

class ChatModel {
  final int chatId;
  final UserModel sender;
  final UserModel receiver;
  final MessageModel message;
  final String sentAt;

  ChatModel(this.chatId, this.sender, this.receiver, this.message, this.sentAt);
}

class UserModel {
  final int userId;

  UserModel(this.userId);
}

class MessageModel {
  final String text;

  final MessageStatus status;

  /// Time and is right is supposed to be calculated from chat model,
  /// these wew used here to increase speed, it ca be improved at a later
  /// time
  final String time;
  final bool isRight;

  MessageModel(
      {required this.text,
      required this.time,
      this.status = MessageStatus.sent,
      required this.isRight});
}

enum MessageStatus {
  sending,
  sent,
  failed,
}
