import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/resources/resources.dart';

class ChatPage extends StatelessWidget {
  final String title;
  const ChatPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  static List<MessageModel> messages = [
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

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: Dimensions.defaultIconSize,
                          height: Dimensions.defaultIconSize,
                          child: IconButton(
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: Dimensions.defaultSpacing),
                      Expanded(
                        child: Hero(
                          tag: title,
                          child: Text(
                            title,
                            style: _theme.textTheme.headlineSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
          const SizedBox(height: 52),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 44, 26, 0),
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
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: messages.length,
                      itemBuilder: (c, i) {
                        var showProfileBox = true;
                        if (i != 0) {
                          var currentChat = messages[i];
                          var previousChat = messages[i - 1];
                          showProfileBox =
                              currentChat.isRight != previousChat.isRight;
                        }
                        return _buildChat(
                          chat: messages[i],
                          showProfileBox: showProfileBox,
                        );
                      },
                    ),
                  ),
                  SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    child: Container(
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
                          decoration: InputDecoration(
                              hintText: "Aaz",
                              isDense: true,
                              filled: true,
                              fillColor: AppColors.greyC4,
                              focusedBorder: AppStyles.focusedTransparentBorder,
                              disabledBorder:
                                  AppStyles.focusedTransparentBorder,
                              enabledBorder: AppStyles.focusedTransparentBorder,
                              errorBorder: AppStyles.focusedTransparentBorder,
                              focusedErrorBorder:
                                  AppStyles.focusedTransparentBorder,
                              errorStyle: errorTextStyle(context),
                          ),
                          onSubmitted: (value) {
                              // Check which focus node is focused
                              print('ayo ${FocusScope.of(context).debugLabel}');
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
                                borderRadius: BorderRadius.circular(
                                    Dimensions.largeRadius),

                                //visualDensity:
                                //VisualDensity.adaptivePlatformDensity,
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                child: const Icon(
                                  Icons.send,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildChat({required MessageModel chat, required bool showProfileBox}) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      return chat.isRight
          ? Container(
              margin: const EdgeInsets.only(bottom: 42),
              child: Row(
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
                                topLeft:
                                    Radius.circular(Dimensions.mediumRadius),
                                topRight:
                                    Radius.circular(Dimensions.mediumRadius),
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
              ),
            )
          : Container(
              margin: const EdgeInsets.only(bottom: 42),
              child: IntrinsicHeight(
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
                              padding:
                                  const EdgeInsets.fromLTRB(18, 13, 18, 12),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.tertiary,
                                borderRadius: const BorderRadius.only(
                                  topLeft:
                                      Radius.circular(Dimensions.mediumRadius),
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
              ),
            );
    });
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

  /// Time and is right is supposed to be calculated from chat model,
  /// these wew used here to increase speed, it ca be improved at a later
  /// time
  final String time;
  final bool isRight;

  MessageModel({required this.text, required this.time, required this.isRight});
}
