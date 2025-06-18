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
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Set max content width (e.g., like Instagram on web)
          double maxWidth = 800;
          double horizontalPadding = constraints.maxWidth > maxWidth ? (constraints.maxWidth - maxWidth) / 2 : 0;

          return Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: ListView(
                children: [
                  const StorySection(),
                  const Divider(height: 0.5),
                  ...samplePosts.map((post) => PostItem(post: post)).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
