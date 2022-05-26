class Scores {
  String id;
  String name;
  List<int> scoresList;
  int? bestScore;

  Scores(
      {required this.id,
      required this.name,
      required this.scoresList,
      this.bestScore});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'scoresList': scoresList,
      'bestScore': bestScore,
    };
  }
}
