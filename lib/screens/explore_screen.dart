import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String? _zoomedImageUrl;
  bool _isZooming = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Color(0xFFEFEFEF),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GridView.builder(
            padding: const EdgeInsets.all(2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: 50,
            itemBuilder: (context, index) {
              final imageUrl = 'https://picsum.photos/300?random=$index';

              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    _zoomedImageUrl = imageUrl;
                    _isZooming = true;
                  });
                },
                onLongPressUp: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    setState(() {
                      _isZooming = false;
                    });
                  });
                },
                child: Image.network(imageUrl, fit: BoxFit.cover),
              );
            },
          ),

          // Zoomed image overlay
          if (_zoomedImageUrl != null)
            AnimatedOpacity(
              opacity: _isZooming ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 150),
              onEnd: () {
                if (!_isZooming) {
                  setState(() {
                    _zoomedImageUrl = null;
                  });
                }
              },
              child: Container(
                color: Colors.black.withOpacity(0.7),
                alignment: Alignment.center,
                child: AnimatedScale(
                  scale: _isZooming ? 1.0 : 0.8,
                  duration: const Duration(milliseconds: 150),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      _zoomedImageUrl!,
                      width: MediaQuery.of(context).size.width * 0.9,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
