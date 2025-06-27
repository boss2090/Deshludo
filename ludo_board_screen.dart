import 'package:flutter/material.dart';
import 'dart:math';
import '../models/token.dart';

class LudoBoardScreen extends StatefulWidget {
  @override
  _LudoBoardScreenState createState() => _LudoBoardScreenState();
}

class _LudoBoardScreenState extends State<LudoBoardScreen> {
  int diceValue = 1;
  LudoToken redToken = LudoToken(position: 0, color: Colors.red);

  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1;
    });
  }

  void moveToken() {
    setState(() {
      redToken.position = (redToken.position + diceValue).clamp(0, 80);
    });
  }

  Widget buildCell(int index) {
    if (index == redToken.position) {
      return Container(
        color: redToken.color,
        child: Center(
          child: Text('🔴', style: TextStyle(fontSize: 20)),
        ),
      );
    } else {
      return Container(
        color: Colors.grey[200],
        child: Center(child: Text('')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ludo Board')),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Dice: $diceValue', style: TextStyle(fontSize: 32)),
          ElevatedButton(onPressed: rollDice, child: Text('Roll Dice')),
          ElevatedButton(onPressed: moveToken, child: Text('Move Token')),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: 81,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
              ),
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(2),
                child: buildCell(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
