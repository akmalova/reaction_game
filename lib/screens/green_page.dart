import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/database.dart';
import 'finish_page.dart';


class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stopwatch = Stopwatch();
    stopwatch.start();
    return GestureDetector(
      
      onTap: (() {
        stopwatch.stop();
        Provider.of<DatabaseService>(context, listen: false).addScore(stopwatch.elapsedMilliseconds);
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
          return const FinishPage();
        }));
      }),
      child: Scaffold(
        backgroundColor: Colors.green[600],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  height: 250.0,
                ),
                Text(
                  'Tap!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
