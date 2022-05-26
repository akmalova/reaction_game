import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'rating_page.dart';
import 'game_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String _bestScore = '';

  @override
  void initState() {
    super.initState();
    _getScore();
  }

  void _getScore() {
    int bestScore =
        Provider.of<DatabaseService>(context, listen: false).getBestScore();
    if (bestScore != -1) {
      _bestScore = 'Best | ' + bestScore.toString() + ' ms';
    }
  }

  void _onTap() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const GamePage();
    }));
  }

  void _onTapRating() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const RatingPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Scaffold(
        floatingActionButton: IconButton(
          iconSize: 50.0,
          onPressed: _onTapRating,
          icon: const Icon(Icons.workspace_premium),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Tap to start!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
                  _bestScore,
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
