class Result {
  final String id;
  final String userId;
  final String category;
  final String score;
  final int attempts;
  final int wrongAttempts;
  final int correctAttempts;

  Result({
    required this.id,
    required this.userId,
    required this.category,
    required this.score,
    required this.attempts,
    required this.wrongAttempts,
    required this.correctAttempts,
  });



  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'category': category,
    'score': score,
    'attempts': attempts,
    'wrongAttempts': wrongAttempts,
    'correctAttempts': correctAttempts
  };
}