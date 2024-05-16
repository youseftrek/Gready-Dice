class User {
  final String email;
  final String name;
  final int score;
  final String avatarUrl;
  final String id;
  final String password;
  User(
      {required this.email,
      required this.name,
      required this.score,
      this.avatarUrl = '',
      this.id = '',
      this.password = 'test'});
}
