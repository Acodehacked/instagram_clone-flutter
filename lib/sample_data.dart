
// instagram_clone/lib/sample_data.dart
import 'models/post.dart';

final sampleUser = User(
  username: 'john_doe',
  profilePic: 'https://i.pravatar.cc/150?img=3',
  posts: 34,
  followers: 1200,
  following: 300,
);

final samplePosts = List.generate(
  5,
      (index) => Post(
    imageUrl: 'https://picsum.photos/500/500?random=$index',
    caption: 'Caption for post $index',
    user: sampleUser,
  ),
);
