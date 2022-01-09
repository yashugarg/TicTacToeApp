import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tic Tac Toe",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.grey.shade800,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.white,
        ),
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: HomePage()),
      ),
    );
  }
}
