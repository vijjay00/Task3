import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'A/a1.dart';
import 'A/editprofile.dart';
import 'B/b1.dart';
import 'main.dart';

void main() {
  runApp(GetMaterialApp(
    // home: const BaseApp(),
    initialRoute: "/a1",
    routes: {
      "/": (context) => MyApp(),
      "/a1": (context) => A1(),
      "/b1": (context) => B1(),
      "/editprofile": (context) => EditProfile(),
    },
  ));
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
