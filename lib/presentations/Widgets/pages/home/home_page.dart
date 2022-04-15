import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_chat_app_flutter/presentations/Widgets/pages/chat/chat_page.dart';

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
    return Scaffold(
      //backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 54, 24, 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Supper Chat',
                        style: GoogleFonts.workSans(
                          textStyle: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                          visualDensity: VisualDensity.adaptivePlatformDensity,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            //TODO: Implement here
                          },
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),

                  /// Search bar: Temporary disabled.
                  // const SizedBox(height: 22),
                  // TextFormField(
                  //   readOnly: true, //false
                  //   autofocus: false,
                  //   // style: ,
                  //   decoration: InputDecoration(
                  //     prefixIcon: const Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 8),
                  //       child: Icon(Icons.search, color: Colors.black),
                  //     ),
                  //     prefixIconConstraints:
                  //         const BoxConstraints(maxHeight: 20, maxWidth: 35),
                  //     hintText: "Contacts",
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
                  const SizedBox(height: 30),
                  Text(
                    'Last Contact',
                    style: GoogleFonts.workSans(
                      textStyle: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 60,
                    width: 359,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      scrollDirection: Axis.horizontal,
                      itemCount: names.length,
                      itemBuilder: (c, i) {
                        return SizedBox(
                          width: 59,
                          height: 59,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    color: AppColors.greyC4,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
                child: ListView.separated(
                  itemCount: names.length,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (c, i) {
                    return GestureDetector(
                      onTap: () {
                        // Push to chat screen with name.
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const ChatPage(),
                            // transitionDuration: Duration(seconds: 3),
                            transitionsBuilder:
                                (___, animation, ____, Widget child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.5, 1.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child:
                                    child, // child is the value returned by pageBuilder
                              );
                            },
                          ),
                        );
                      },
                      child: SizedBox(
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
                                          style: GoogleFonts.workSans(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "14:23",
                                        style: GoogleFonts.workSans(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromRGBO(
                                                168, 168, 168, 1),
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    'lorem ispum',
                                    style: GoogleFonts.workSans(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
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
      ),
    );
  }
}