
// instagram_clone/lib/models/post.dart
class Post {
  final String imageUrl;
  final String caption;
  final User user;
  Post({required this.imageUrl, required this.caption, required this.user});
}

class User {
  final String username;
  final String profilePic;
  final int posts;
  final int followers;
  final int following;

  User({
    required this.username,
    required this.profilePic,
    required this.posts,
    required this.followers,
    required this.following,
  });
}