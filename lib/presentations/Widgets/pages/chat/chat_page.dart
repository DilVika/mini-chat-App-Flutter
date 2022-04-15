import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/styles.dart';
import '/resources/resources.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: IconButton(
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // TextFormField(
                  //   readOnly: true,
                  //   //false
                  //   autofocus: false,
                  //   // style: ,
                  //   decoration: InputDecoration(
                  //     prefixIcon: Container(
                  //       // color: Colors.blue,
                  //       padding: EdgeInsets.only(
                  //         left: 9,
                  //       ),
                  //       child: const Icon(Icons.search, color: Colors.black),
                  //     ),
                  //     prefixIconConstraints: BoxConstraints(
                  //         minHeight: 24,
                  //         maxHeight: 24,
                  //         minWidth: 41,
                  //         maxWidth: 41),
                  //     hintText: "Search conversations",
                  //     // hintStyle: textFieldPlaceholderTextStyle(context),
                  //     isDense: true,
                  //     filled: true,
                  //     fillColor: AppColors.greyC4,
                  //     focusedBorder: AppStyles.focusedTransparentBorder,
                  //     disabledBorder: AppStyles.focusedTransparentBorder,
                  //     enabledBorder: AppStyles.focusedTransparentBorder,
                  //     errorBorder: AppStyles.focusedTransparentBorder,
                  //     focusedErrorBorder: AppStyles.focusedTransparentBorder,
                  //     errorStyle: errorTextStyle(context),
                  //   ),
                  //   textInputAction: TextInputAction.next,
                  //   keyboardType: TextInputType.text,
                  //   onSaved: (val) {},
                  //   onEditingComplete: () {},
                  //   onChanged: (val) {},
                  //   // validator: (val) {},
                  //   onTap: () {},
                  // ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Justin Wan",
                          style: GoogleFonts.workSans(
                            textStyle: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Container(
                      //   width: 45,
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(45),
                      //     color: AppColors.greyC4,
                      //   ),
                      //   child: SizedBox(
                      //     width: 24,
                      //     height: 24,
                      //     child: IconButton(
                      //       visualDensity:
                      //           VisualDensity.adaptivePlatformDensity,
                      //       padding: EdgeInsets.zero,
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Icons.phone,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 17),
                      // Container(
                      //   width: 45,
                      //   height: 45,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(45),
                      //     color: AppColors.greyC4,
                      //   ),
                      //   child: SizedBox(
                      //     width: 24,
                      //     height: 24,
                      //     child: IconButton(
                      //       visualDensity:
                      //           VisualDensity.adaptivePlatformDensity,
                      //       padding: EdgeInsets.zero,
                      //       onPressed: () {},
                      //       icon: const Icon(
                      //         Icons.videocam,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  // SizedBox(height: 30.h),
                ],
              ),
            ),
            const SizedBox(height: 52),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 44, 26, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffC4C4C4).withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, -4), // changes position of shadow
                    ),
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
                    Container(
                      margin: const EdgeInsets.only(top: 9, bottom: 9),
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.greyC4,
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 25),
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              //false
                              autofocus: false,
                              // style: ,
                              decoration: InputDecoration(
                                hintText: "Aa",
                                // hintStyle: textFieldPlaceholderTextStyle(context),
                                isDense: true,
                                filled: true,
                                fillColor: AppColors.greyC4,
                                focusedBorder:
                                    AppStyles.focusedTransparentBorder,
                                disabledBorder:
                                    AppStyles.focusedTransparentBorder,
                                enabledBorder:
                                    AppStyles.focusedTransparentBorder,
                                errorBorder: AppStyles.focusedTransparentBorder,
                                focusedErrorBorder:
                                    AppStyles.focusedTransparentBorder,
                                errorStyle: errorTextStyle(context),
                              ),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onSaved: (val) {},
                              onEditingComplete: () {},
                              onChanged: (val) {},
                              // validator: (val) {},
                              onTap: () {},
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: const Color(0xffF4F4F4),
                            ),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: IconButton(
                                visualDensity:
                                    VisualDensity.adaptivePlatformDensity,
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.black,
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
          ],
        ),
      ),
    );
  }

  _buildChat({required MessageModel chat, required bool showProfileBox}) {
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
                  child: Text(chat.time),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(18, 13, 18, 12),
                          decoration: const BoxDecoration(
                            color: Color(0xffD0D0D0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
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
                        width: 40,
                        height: 40,
                        color: const Color(0xffD0D0D0),
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
                            decoration: const BoxDecoration(
                              color: Color(0xffD0D0D0),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
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
                          child: Text(chat.time),
                        ),
                      )
                    ],
                  ),
                ],
              ),
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

  /// Time and is right is supposed to be calculated from chat model,
  /// these wew used here to increase speed, it ca be improved at a later
  /// time
  final String time;
  final bool isRight;

  MessageModel({required this.text, required this.time, required this.isRight});
}
