import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/presentations/Widgets/pages/chat/chat_page.dart';

// Import resource.dart relatives path
import '/resources/resources.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const List<String> names = [
    "Justin Wan",
    "Eathan Kwan",
    "Tannzz Wan",
    "Cecily Wan",
    "Oscar Wan",
    "Bukunmi Aluko",
    "John Doe",
    "Lorem Master",
    "Elon Musk",
    "Bill Gates",
    "Jeff Bezos"
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    // final listviewMessages = ListView.separated(
    //   padding:
    //       EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    //   itemCount: names.length,
    //   physics:
    //       const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    //   itemBuilder: (c, i) {
    //     return GestureDetector(
    //       onTap: () {
    //         // Push to chat screen with name.
    //         Navigator.of(context).push(
    //           PageRouteBuilder(
    //             pageBuilder: (context, animation, secondaryAnimation) =>
    //                 ChatPage(title: names[i]),
    //             transitionDuration: AnimationConstants.defautTransitionDuration,
    //             reverseTransitionDuration:
    //                 AnimationConstants.defautTransitionDuration,
    //             transitionsBuilder: (___, animation, ____, Widget child) {
    //               final topPadding =
    //               return AnimatedBuilder(
    //                // animation: Tween,
    //                 builder: (BuildContext context, Widget? child) {},
    //                 // child is the value returned by pageBuilder
    //               );
    //             },
    //           ),
    //         );
    //       },
    //       child: SizedBox(
    //         key: ValueKey<int>(i),
    //         width: 340,
    //         height: 60,
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(8),
    //               child: Container(
    //                 width: 60,
    //                 height: 60,
    //                 // margin: EdgeInsets.only(right: 14.w),
    //                 color: AppColors.greyC4,
    //               ),
    //             ),
    //             const SizedBox(width: 14),
    //             Expanded(
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     mainAxisSize: MainAxisSize.max,
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     children: [
    //                       Expanded(
    //                         child: Hero(
    //                           flightShuttleBuilder:
    //                               // Implement flightShuttleBuilder
    //                               (
    //                             BuildContext flightContext,
    //                             Animation<double> animation,
    //                             HeroFlightDirection flightDirection,
    //                             BuildContext fromHeroContext,
    //                             BuildContext toHeroContext,
    //                           ) {
    //                             return DefaultTextStyleTransition(
    //                               style: TextStyleTween(
    //                                 begin: DefaultTextStyle.of(fromHeroContext)
    //                                     .style,
    //                                 end: DefaultTextStyle.of(toHeroContext)
    //                                     .style,
    //                               ).animate(animation),
    //                               child: toHeroContext.widget, //,
    //                             );
    //                           },
    //                           tag: names[i],
    //                           child: Text(
    //                             names[i],
    //                             style: _theme.textTheme.titleMedium,
    //                             maxLines: 1,
    //                             overflow: TextOverflow.ellipsis,
    //                           ),
    //                         ),
    //                       ),
    //                       Text(
    //                         "14:23",
    //                         style: _theme.textTheme.labelLarge,
    //                       ),
    //                     ],
    //                   ),
    //                   const SizedBox(height: 3),
    //                   Text(
    //                     'lorem ispum',
    //                     style: _theme.textTheme.bodyMedium,
    //                     maxLines: 1,
    //                     overflow: TextOverflow.ellipsis,
    //                   ),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    //   separatorBuilder: (c, i) {
    //     return const SizedBox(height: 24);
    //   },
    // );

    // Widget _mainContentContainer(Widget child) {
    //   return Container(
    //       padding: const EdgeInsets.fromLTRB(24, 20, 26, 0),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: const BorderRadius.only(
    //           topLeft: Radius.circular(24),
    //           topRight: Radius.circular(24),
    //         ),
    //         boxShadow: [
    //           BoxShadow(
    //             color: _theme.colorScheme.shadow,
    //             spreadRadius: 0,
    //             blurRadius: 8,
    //             offset: const Offset(0, -4), // changes position of shadow
    //           ),
    //         ],
    //       ),
    //       child: child);
    // }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: Dimensions.defaultPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: AnimationConstants.titleHeroTag,
                      child: Text(
                        'Nerd Chat',
                        style: _theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.defaultIconSize,
                      height: Dimensions.defaultIconSize,
                      child: CupertinoButton(
                        //visualDensity: VisualDensity.adaptivePlatformDensity,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          //TODO: Implement here
                        },
                        child: const Icon(
                          Icons.logout_rounded,
                          //color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.defaultVerticalPadding),
                Text('Last Contact', style: _theme.textTheme.titleSmall),
                const SizedBox(height: Dimensions.defaultVerticalPadding),
                SizedBox(
                  height: Dimensions.sheetSmallHeight,
                  width: Dimensions.sheetsmallWidth,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length,
                    itemBuilder: (c, i) {
                      return SizedBox(
                        width: Dimensions.avatarHolderSize,
                        height: Dimensions.avatarHolderSize,
                        child: Stack(
                          fit: StackFit.loose,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.smallRadius),
                                child: Container(
                                  width: Dimensions.avatarSize,
                                  height: Dimensions.avatarSize,
                                  color: AppColors.greyC4,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: Dimensions.onlineDotRadius,
                                height: Dimensions.onlineDotRadius,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.onlineDotRadius),
                                  color: AppColors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: Dimensions.defaultSpacing,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 20, 26, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: _theme.colorScheme.shadow,
                    spreadRadius: 0,
                    blurRadius: 8,
                    offset: const Offset(0, -4), // changes position of shadow
                  ),
                ],
              ),
              child: ListView.separated(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                itemCount: names.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (c, i) {
                  return GestureDetector(
                    onTap: () {
                      // Push to chat screen with name.
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ChatPage(
                            title: names[i],
                          ),
                          transitionDuration:
                              AnimationConstants.defautTransitionDuration,
                          reverseTransitionDuration:
                              AnimationConstants.defautTransitionDuration,
                          transitionsBuilder:
                              (___, animation, ____, Widget child) {
                            // animation = CurvedAnimation(
                            //     curve: Curves.easeIn, parent: animation);
                            return Align(
                                child: FadeTransition(
                              // sizeFactor: animation,
                              opacity: animation,
                              child: child,
                              //axisAlignment: 0.0,
                            ));
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: names[i],
                      flightShuttleBuilder: (context, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        bool isPush =
                            flightDirection == HeroFlightDirection.push;
                        if (isPush) {
                          print('Push');
                          return Stack(
                            children: [
                              FadeTransition(
                                opacity: Tween<double>(begin: 1.0, end: 0.0)
                                    .animate(animation),
                                child: Center(child: fromHeroContext.widget),
                              ),
                              FadeTransition(
                                opacity: Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(animation),
                                child: toHeroContext.widget,
                              ),
                            ],
                          );
                        } else {
                          print('Pop');
                          print(flightDirection);
                          return Stack(
                            children: [
                              FadeTransition(
                                opacity: Tween<double>(begin: 1.0, end: 0.0)
                                    .animate(animation),
                                child: fromHeroContext.widget,
                              ),
                              FadeTransition(
                                opacity: Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(animation),
                                child: Center(child: toHeroContext.widget),
                              ),
                            ],
                          );
                        }
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24)
                              //topLeft: Radius.circular(24),
                              //topRight: Radius.circular(24),
                              ),
                        ),
                        key: ValueKey<int>(i),
                        width: 340,
                        height: 60,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 60,
                                height: 60,
                                // margin: EdgeInsets.only(right: 14.w),
                                color: AppColors.greyC4,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          names[i],
                                          style: _theme.textTheme.titleMedium,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "14:23",
                                        style: _theme.textTheme.labelLarge,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'lorem ispum',
                                    style: _theme.textTheme.bodyMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (c, i) {
                  return const SizedBox(height: 24);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
