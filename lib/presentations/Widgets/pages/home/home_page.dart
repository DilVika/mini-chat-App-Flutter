import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '/presentations/Widgets/pages/chat/chat_page.dart';

// Import resource.dart relatives path
import '/resources/resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

//TODO: for PoC
  Future<User?> loginGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Sign in aborted
    if (googleUser == null) {
      print('Sigin Error');
    }

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    User? firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    // if (firebaseUser == null || firebaseUser.displayName == null) {
    //   print('Sigin Error');
    // }

    if (firebaseUser != null) {
    // Check is already sign up
    final QuerySnapshot result =
        await FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).where(FirestoreConstants.id, isEqualTo: firebaseUser.uid).get();
    final List < DocumentSnapshot > documents = result.docs;
    if (documents.length == 0) {
        // Update data to server if new user
        FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc(firebaseUser.uid).set(
            { FirestoreConstants.nickname: firebaseUser.displayName, FirestoreConstants.photoUrl: firebaseUser.photoURL, 'id': firebaseUser.uid });
    }
}

    return firebaseUser;
  }

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
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedIn = false;

  int _limit = 20;
  int _limitIncrement = 20;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

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
                      child: (_isLoggedIn)
                          ? Text(
                            //TODO: User info
                            UIConfigs.appName,
                            style: _theme.textTheme.headlineSmall,
                          )
                          : GestureDetector(
                              onTap: () {},
                              child: Text(
                                UIConfigs.appName,
                                style: _theme.textTheme.headlineSmall,
                              ),
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
                        child: Visibility(
                          visible: _isLoggedIn,
                          child: const Icon(
                            Icons.logout_rounded,
                            //color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: Dimensions.defaultVerticalPadding),
                Text('Contact', style: _theme.textTheme.titleSmall),
                const SizedBox(height: Dimensions.defaultVerticalPadding),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .limit(_limit)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: Dimensions.sheetSmallHeight,
                          width: Dimensions.sheetsmallWidth,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            scrollDirection: Axis.horizontal,
                            itemCount: HomePage.names.length,
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: Dimensions.defaultSpacing,
                              );
                            },
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.only(top: Dimensions.defaultVerticalPadding),
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
                itemCount: HomePage.names.length,
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
                            chatContact: HomePage.names[i],
                          ),
                          transitionDuration:
                              AnimationConstants.defautTransitionDuration,
                          reverseTransitionDuration:
                              AnimationConstants.defautTransitionDuration,
                          transitionsBuilder:
                              (___, animation, ____, Widget child) {
                            return Align(
                                child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ));
                          },
                        ),
                      );
                    },
                    child: Hero(
                      tag: HomePage.names[i],
                      flightShuttleBuilder: (context, animation,
                          flightDirection, fromHeroContext, toHeroContext) {
                        bool isPush =
                            flightDirection == HeroFlightDirection.push;
                        if (isPush) {
                          return Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: FadeTransition(
                                  opacity: Tween<double>(begin: 1.0, end: 0.0)
                                      .animate(animation),
                                  child: fromHeroContext.widget,
                                ),
                              ),
                              FadeTransition(
                                opacity: Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(animation),
                                child: toHeroContext.widget,
                              ),
                            ],
                          );
                        } else {
                          return Stack(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: FadeTransition(
                                  opacity: Tween<double>(begin: 1.0, end: 0.0)
                                      .animate(animation),
                                  child: toHeroContext.widget,
                                ),
                              ),
                              FadeTransition(
                                opacity: Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(animation),
                                child: fromHeroContext.widget, //
                              ),
                            ],
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Dimensions.defaultSpacing,
                          horizontal: Dimensions.defaultHorizontalPadding,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
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
                                          HomePage.names[i],
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (c, i) {
                  return const SizedBox(height: 1);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
