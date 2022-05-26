import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

class FinishPage extends StatefulWidget {
  const FinishPage({Key? key}) : super(key: key);

  @override
  _FinishPageState createState() => _FinishPageState();
}

class _FinishPageState extends State<FinishPage> {
  late int score;
  late int bestScore;

  @override
  void initState() {
    super.initState();
    _getScore();
  }

  void _getScore() {
    score = Provider.of<DatabaseService>(context, listen: false).getLastScore();
    bestScore =
        Provider.of<DatabaseService>(context, listen: false).getBestScore();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/game');
      },
      child: Scaffold(
        floatingActionButton: IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.pushNamed(context, '/rating');
          },
          icon: const Icon(Icons.workspace_premium),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 100.0,
                ),
                Image.asset(
                  'images/clock_time_5025.png',
                  height: 100.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  '$score ms',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'When the red box turns green,\ntap as quickly as you can.',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Best | $bestScore ms',
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
