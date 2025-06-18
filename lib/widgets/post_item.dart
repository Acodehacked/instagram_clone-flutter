import 'package:flutter/material.dart';
import '../models/post.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> with SingleTickerProviderStateMixin {
  bool _showHeart = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 400), () {
          setState(() {
            _showHeart = false;
          });
        });
      }
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _showHeart = true;
    });
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.user.profilePic),
          ),
          title: Text(post.user.username, style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),

        // Post image with gesture and animation
        GestureDetector(
          onDoubleTap: _handleDoubleTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(post.imageUrl, width: double.infinity, fit: BoxFit.cover),
              if (_showHeart)
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Icon(Icons.favorite, color: Colors.white, size: 100),
                ),
            ],
          ),
        ),

        // Icons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.favorite_border, size: 30),
                  SizedBox(width: 15),
                  Icon(Icons.mode_comment_outlined, size: 30),
                  SizedBox(width: 15),
                  Icon(Icons.send, size: 30),
                ],
              ),
              const Icon(Icons.bookmark_border, size: 30),
            ],
          ),
        ),

        // Likes
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "Liked by user1 and others",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "${post.user.username} ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),

        // Timestamp
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            "2 hours ago",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
