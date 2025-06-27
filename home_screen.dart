import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeshLudo')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome to DeshLudo', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Play Online'),
            onPressed: () {
              Navigator.pushNamed(context, '/board');
            },
          ),
          ElevatedButton(
            child: Text('Play With Computer'),
            onPressed: () {
              Navigator.pushNamed(context, '/board');
            },
          ),
          ElevatedButton(
            child: Text('Wallet'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
