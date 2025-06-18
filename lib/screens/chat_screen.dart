import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('Username', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Stories/notes section
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage('https://picsum.photos/100'),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.blue,
                            child: Text(
                              'Hi',
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('User $index', style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),

          // Tabs (Primary / General / Requests)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: const [

                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.indigo,borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text('Primary', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
                  ),),
                SizedBox(width: 10),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text('General', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                  ),),
                SizedBox(width: 10),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12,borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text('Requests', style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black)),
                  ),),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Chat list
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) => ListTile(
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('https://picsum.photos/100'),
                ),
                title: Text('User $index', style: const TextStyle(fontWeight: FontWeight.w500)),
                subtitle: const Text('sent reel by __senr_sni '),
                trailing: const Icon(Icons.camera_alt_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}