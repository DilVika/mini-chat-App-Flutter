import 'package:flutter/material.dart';
import 'package:mini_chat_app_flutter/presentations/Widgets/pages/home/home_page.dart';
import 'package:mini_chat_app_flutter/theme.dart';

import 'resources/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Create and init a focus node. Dispose when unesed
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(debugLabel: 'GLOBAL');
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(builder: (context) {
    return GestureDetector(
      onTap: () {
        print('tap');
        // unfocus current node in FocusScope
        FocusScope.of(context).unfocus();
        _focusNode.requestFocus();
        print(
            'hasFocus: ${_focusNode.hasFocus}, debugLabel: ${_focusNode.debugLabel}');
        print('ayo ${FocusScope.of(context).debugLabel}');
      },
      child: MaterialApp(
        title: UI.appName,
        theme: AppTheme.defaultTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home: const HomePage(),
      ),
    );
    // });
  }
}
