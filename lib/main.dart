import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/http/index.dart';
import 'package:flutter_app/page/test/randomWords.dart';
import 'package:flutter_app/page/home/main-screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  DioUtil.init();
  // runApp(MyApp());
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugPaintBaselinesEnabled = false;
    return MaterialApp(
      locale: const Locale('zh', 'CN'),
      routes: {
        "/test": (context) => RandomWords(),
        "/": (context) => MainScreen(title: "title"),
      },
      title: 'fcf flutter test',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
