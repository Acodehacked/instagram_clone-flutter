import 'package:flutter/material.dart';
import '../widgets/post_item.dart';
import '../sample_data.dart';
import '../widgets/story_item.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/logo.png',
            height: 35,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const StorySection(),
          const Divider(height: 0.5),
          ...samplePosts.map((post) => PostItem(post: post)).toList(),
        ],
      ),
    );
  }
}
