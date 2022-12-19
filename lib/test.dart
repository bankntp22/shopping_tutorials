import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Map<String, int> playerScore = {
    'Kane': 0,
    'Kulusevski': 0,
    'Son': 0,
  };

  addScore(String player, int score) {
    setState(() {
      playerScore.update(player, (value) => value + score);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Score Example'),
          ),
          body: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Player 1 : ${playerScore['Kane']}'),
                    Text('Player 1 : ${playerScore['Kulusevski']}'),
                    Text('Player 1 : ${playerScore['Son']}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => addScore('Kane', 10),
                      child: Text('Add Score'),
                    ),
                    ElevatedButton(
                      onPressed: () => addScore('Kulusevski', 21),
                      child: Text('Add Score'),
                    ),
                    ElevatedButton(
                      onPressed: () => addScore('Son', 7),
                      child: Text('Add Score'),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
