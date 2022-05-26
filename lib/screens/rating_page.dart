import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  String _rating = 'You havent played yet';
  String _bestScore = '';

  @override
  void initState() {
    getScore();
    super.initState();
  }

  void getScore() {
    int bestScore =
        Provider.of<DatabaseService>(context, listen: false).getBestScore();
    if (bestScore != -1) {
      _bestScore = 'Best | ' + bestScore.toString() + ' ms';
    }
    List<int> scores =
        Provider.of<DatabaseService>(context, listen: false).getScoresList();
    if (scores.isNotEmpty) {
      _rating = '';
      for (int i = 0; i < scores.length; i++) {
        _rating += '${i + 1}. ${scores[i]} ms\n';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text(
          'Back',
          style: TextStyle(fontSize: 20.0, color: Colors.black),
        ),
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
              const Text(
                'Last 5 tries',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                _rating,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20.0,
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
    );
  }
}
