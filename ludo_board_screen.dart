import 'package:flutter/material.dart';
import 'dart:math';

class LudoToken {
  int position;
  final Color color;
  final String emoji;

  LudoToken({required this.position, required this.color, required this.emoji});
}

class LudoBoardScreen extends StatefulWidget {
  @override
  _LudoBoardScreenState createState() => _LudoBoardScreenState();
}

class _LudoBoardScreenState extends State<LudoBoardScreen> {
  int diceValue = 1;
  int currentPlayer = 0; // 0: Red, 1: Green, 2: Blue, 3: Yellow

  List<LudoToken> players = [
    LudoToken(position: 0, color: Colors.red, emoji: '🔴'),
    LudoToken(position: 0, color: Colors.green, emoji: '🟢'),
    LudoToken(position: 0, color: Colors.blue, emoji: '🔵'),
    LudoToken(position: 0, color: Colors.yellow, emoji: '🟡'),
  ];

  void rollDice() {
    setState(() {
      diceValue = Random().nextInt(6) + 1;
    });
  }

  void moveToken() {
    setState(() {
      players[currentPlayer].position += diceValue;
      players[currentPlayer].position =
          players[currentPlayer].position.clamp(0, 80);

      // যদি 6 না আসে, তাহলে পরের প্লেয়ার
      if (diceValue != 6) {
        currentPlayer = (currentPlayer + 1) % 4;
      }
    });
  }

  Widget buildCell(int index) {
    for (var player in players) {
      if (player.position == index) {
        return Container(
          color: player.color.withOpacity(0.4),
          child: Center(
            child: Text(player.emoji, style: TextStyle(fontSize: 18)),
          ),
        );
      }
    }
    return Container(
      color: Colors.grey[200],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DeshLudo - 4 Player')),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text('Dice: 🎲 $diceValue', style: TextStyle(fontSize: 28)),
          Text(
            'Turn: ${players[currentPlayer].emoji}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: rollDice, child: Text('Roll Dice')),
              ElevatedButton(onPressed: moveToken, child: Text('Move Token')),
            ],
          ),
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
