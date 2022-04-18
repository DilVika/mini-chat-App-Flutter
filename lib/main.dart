import 'package:flutter/material.dart';
import 'package:mini_chat_app_flutter/presentations/Widgets/pages/home/home_page.dart';
import 'package:mini_chat_app_flutter/theme.dart';

import 'resources/resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ScreenUtilInit(builder: (context) {
    return MaterialApp(
      title: UI.appName,
      theme: AppTheme.defaultTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
    // });
  }
}
