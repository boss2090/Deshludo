import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/ludo_board_screen.dart';

void main() {
  runApp(DeshLudoApp());
}

class DeshLudoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeshLudo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/board': (context) => LudoBoardScreen(),
      },
    );
  }
}
