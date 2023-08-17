import 'package:flutter/material.dart';
import 'package:notesapp/enum/my_color_enum.dart';
import 'package:notesapp/extensions/my_color_extensions.dart';
import 'package:notesapp/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          iconSize: 38,
          backgroundColor: MyColor.nero.color,
          elevation: 3,
          shape: const CircleBorder(),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: MyColor.nero.color,
          elevation: 0,
        ),
        scaffoldBackgroundColor: MyColor.nero.color,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
