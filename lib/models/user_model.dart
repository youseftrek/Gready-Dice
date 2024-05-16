class User {
  final String email;
  final String name;
  final int score;
  final String avatar;
  final String id;
  final String password;
  User(
      {required this.email,
      required this.name,
      required this.score,
      this.avatar = '',
      this.id = '',
      this.password = 'test'});
}
