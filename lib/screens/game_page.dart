import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'finish_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isRed = true;
  final stopwatch = Stopwatch();

  void _timer() {
    Timer(Duration(seconds: Random().nextInt(5) + 2), () {
      setState(() {
        _isRed = false;
        stopwatch.start();
      });
    });
  }

  void _onTap() {
    stopwatch.stop();
    Provider.of<DatabaseService>(context, listen: false)
        .addScore(stopwatch.elapsedMilliseconds);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return const FinishPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    _timer();
    return GestureDetector(
      onTap: _isRed ? null : _onTap,
      child: Scaffold(
        backgroundColor: _isRed ? Colors.red[900] : Colors.green[600],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 100.0,
                ),
                _isRed
                    ? Image.asset(
                        'images/clock_time_5025.png',
                        height: 100.0,
                      )
                    : Container(
                        height: 100.0,
                      ),
                const SizedBox(
                  height: 50.0,
                ),
                Text(
                  _isRed ? 'Wait for Green' : 'Tap!',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
