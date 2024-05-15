
class LeaderboardDetail {
  String image;
  String name;
  String rank;
  int point;

  LeaderboardDetail({
    required this.image,
    required this.name,
    required this.rank,
    required this.point,
  });
}

List<LeaderboardDetail> userItems = [
  LeaderboardDetail(
    image: "assets/images/a.png",
    name: 'Dora Hines',
    rank: "4 ",
    point: 97,
  ),
  LeaderboardDetail(
    image: "assets/images/b.png",
    name: 'Alise Smith',
    rank: "5 ",
    point: 95,
  ),
  LeaderboardDetail(
    image: "assets/images/c.png",
    name: 'Boss Dee',
    rank: "6 ",
    point: 32,
  ),
  LeaderboardDetail(
    image: "assets/images/d.png",
    name: 'Gender Tie',
    rank: "7 ",
    point: 4900,
  ),
  LeaderboardDetail(
    image: "assets/images/f.jpeg",
    name: 'Roma Roy',
    rank: "8 ",
    point: 4100,
  ),
  LeaderboardDetail(
    image: "assets/images/h.jpeg",
    name: 'Alta Koch',
    rank: "43",
    point: 2200,
  ),
  LeaderboardDetail(
    image: "assets/images/a.png",
    name: 'Dora Hines',
    rank: "4 ",
    point: 6432,
  ),
  LeaderboardDetail(
    image: "assets/images/b.png",
    name: 'Alise Smith',
    rank: "5 ",
    point: 5232,
  ),
  LeaderboardDetail(
    image: "assets/images/c.png",
    name: 'Boss Dee',
    rank: "6 ",
    point: 5200,
  ),
  LeaderboardDetail(
    image: "assets/images/d.png",
    name: 'Gender Tie',
    rank: "7 ",
    point: 4900,
  ),
  LeaderboardDetail(
    image: "assets/images/f.jpeg",
    name: 'Roma Roy',
    rank: "8 ",
    point: 4100,
  ),
  LeaderboardDetail(
    image: "assets/images/h.jpeg",
    name: 'Alta Koch',
    rank: "43",
    point: 2200,
  ),
];

// class User{
//   final String email;
//   final String name;
//   final int score;
//   final String avatarUrl;
//   final int _id;

//   User({
//     required this.email,
//     required this.name,
//     required this.score,
//     required this.avatarUrl,
//     required int id
// }): _id = id;
// }

