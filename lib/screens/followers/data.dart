part of 'followers.dart';

class _Follower {
  final String name;
  final String username;
  final String imagePath;
  final bool hasStory;
  final bool hasUnseenBadge;

  const _Follower({
    required this.name,
    required this.username,
    required this.imagePath,
    this.hasStory = false,
    this.hasUnseenBadge = false,
  });
}

const List<_Follower> _kFollowers = [
  _Follower(name: 'Calire Alloy',  username: '@jsmith456',  imagePath: 'assets/pngs/avatar_1.png', hasStory: false),
  _Follower(name: 'Charlie Clark', username: '@mike_t',     imagePath: 'assets/pngs/avatar_2.png', hasStory: true,  hasUnseenBadge: true),
  _Follower(name: 'Lire Offion',   username: '@sarahj',     imagePath: 'assets/pngs/avatar_3.png', hasStory: true),
  _Follower(name: 'Kai Bennet',    username: '@kaib',        imagePath: 'assets/pngs/avatar_4.png', hasStory: false),
  _Follower(name: 'Maya Lin',      username: '@mayalin',     imagePath: 'assets/pngs/avatar_5.png', hasStory: true),
  _Follower(name: 'Jasper Cole',   username: '@jasperc',     imagePath: 'assets/pngs/avatar_6.png', hasStory: false),
  _Follower(name: 'Zara Noor',     username: '@znoor',       imagePath: 'assets/pngs/avatar_7.png', hasStory: true),
  _Follower(name: 'Liam Hart',     username: '@liamh',       imagePath: 'assets/pngs/avatar_8.png', hasStory: false),
  _Follower(name: 'Elena Ford',    username: '@elenaf',      imagePath: 'assets/pngs/avatar_9.png', hasStory: true),
  _Follower(name: 'Ravi Singh',    username: '@ravis',       imagePath: 'assets/pngs/avatar_10.png', hasStory: false),
  _Follower(name: 'Sofia Kim',     username: '@sofiak',      imagePath: 'assets/pngs/avatar_11.png', hasStory: true),
];