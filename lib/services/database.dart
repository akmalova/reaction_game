import 'package:cloud_firestore/cloud_firestore.dart';
import '../scores.dart';

class DatabaseService {
  final DocumentReference _scoresDocument =
      FirebaseFirestore.instance.collection('scores').doc();
  late String _name;
  late int _lastScore;
  int _bestScore = -1;
  final List<int> _scoresList = [];

  Future addUser(String name) async {
    _name = name;
    Scores scores = Scores(id: _scoresDocument.id, name: name, scoresList: []);
    return await _scoresDocument.set(scores.toMap());
  }

  Future addScore(int score) async {
    _lastScore = score;

    if (_bestScore == -1) {
      _bestScore = score;
    } else if (_bestScore > score) {
      _bestScore = score;
    }

    if (_scoresList.length > 4) {
      _scoresList.removeLast();
    }
    _scoresList.insert(0, score);

    Scores scores = Scores(
        id: _scoresDocument.id,
        name: _name,
        scoresList: _scoresList,
        bestScore: _bestScore);
    return await _scoresDocument.set(scores.toMap());
  }

  int getLastScore() {
    return _lastScore;
  }

  int getBestScore() {
    return _bestScore;
  }

  List<int> getScoresList() {
    return _scoresList;
  }
}
