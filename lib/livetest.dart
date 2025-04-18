void main() {
  List<Map<String, dynamic>> stuInfo = [
    {"name": "Alice", "scores": [85, 90, 78]},
    {"name": "Bob", "scores": [88, 76, 95]},
    {"name": "Charlie", "scores": [90, 92, 85]}
  ];

  Map<String, double> avScore = {};

  for (var student in stuInfo) {
    String name = student["name"];
    List<int> scores = List<int>.from(student["scores"]);
    double average = scores.reduce((a, b) => a + b) / scores.length;
    avScore[name] = double.parse(average.toStringAsFixed(2));
  }

  var sortedScores = Map.fromEntries(
      avScore.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value))
  );

  print(sortedScores);
}
