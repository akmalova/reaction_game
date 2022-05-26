import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'rating_page.dart';
import 'game_page.dart';

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

  void _onTap() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const GamePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
        floatingActionButton: IconButton(
          iconSize: 50.0,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return const RatingPage();
            }));
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
