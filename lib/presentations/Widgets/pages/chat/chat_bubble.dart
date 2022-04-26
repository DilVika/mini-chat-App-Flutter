part of 'chat_page.dart';

class _ChatBubble extends StatelessWidget {
  final _MessageModel chat;
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
                  chat.timeString,
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
                          chat.timeString,
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
