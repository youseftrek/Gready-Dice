class User{
  final String email;
  final String name;
  final int score;
  final String avatarUrl;
  final int _id;

  User({
    required this.email,
    required this.name,
    required this.score,
    required this.avatarUrl,
    required int id
}): _id = id;
}