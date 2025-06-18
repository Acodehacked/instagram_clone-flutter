import 'package:flutter/material.dart';
import '../sample_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sampleUser;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: Row(
            children: [
              Text(user.username, style: const TextStyle(color: Colors.black)),
              const Icon(Icons.keyboard_arrow_down, color: Colors.black),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_box_outlined, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePic),
                    radius: 40,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildStatColumn("Posts", user.posts),
                        _buildStatColumn("Followers", user.followers),
                        _buildStatColumn("Following", user.following),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(user.username, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Edit Profile", style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(icon: Icon(Icons.grid_on, color: Colors.black)),
                Tab(icon: Icon(Icons.person_pin_outlined, color: Colors.black)),
                Tab(icon: Icon(Icons.video_call, color: Colors.black)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGridPosts(),
                  _buildGridCollabs(),
                  _buildGridReels(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, int count) {
    return Column(
      children: [
        Text('$count', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildGridPosts() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemBuilder: (context, index) => Image.network(
        'https://picsum.photos/300?random=$index',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGridCollabs() {
    return Center(
      child: Text("Collabs coming soon..."),
    );
  }

  Widget _buildGridReels() {
    return Center(
      child: Text("Reels will be available soon..."),
    );
  }
}