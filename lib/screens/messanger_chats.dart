import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class MessangerChats extends StatelessWidget {
  const MessangerChats({super.key});

  final List<Map<String, dynamic>> _stories = const [
    {'image': 'assets/images/287_62.png', 'name': 'Joshua', 'isOnline': true},
    {'image': 'assets/images/287_67.png', 'name': 'Martin', 'isOnline': true},
    {'image': 'assets/images/287_72.png', 'name': 'Karen', 'isOnline': true},
    {'image': 'assets/images/287_77.png', 'name': 'Martha', 'isOnline': true},
    {'image': 'assets/images/287_39.png', 'name': 'Davis', 'isOnline': false},
    {'image': 'assets/images/287_44.png', 'name': 'Maisy', 'isOnline': false},
  ];

  final List<Map<String, dynamic>> _chats = const [
    {
      'image': 'assets/images/287_10.png',
      'name': 'Martin Randolph',
      'message': 'You: What’s man! · 9:40 AM',
      'isRead': true
    },
    {
      'image': 'assets/images/287_19.png',
      'name': 'Andrew Parker',
      'message': 'You: Ok, thanks! · 9:25 AM',
      'isRead': true
    },
    {
      'image': 'assets/images/287_29.png',
      'name': 'Karen Castillo',
      'message': 'You: Ok, See you in To… · Fri',
      'isRead': true
    },
    {
      'image': 'assets/images/287_44.png',
      'name': 'Maisy Humphrey',
      'message': 'Have a good day, Maisy! · Fri',
      'isRead': true
    },
    {
      'image': 'assets/images/287_39.png',
      'name': 'Joshua Lawrence',
      'message': 'The business plan loo…  · Thu',
      'isRead': false
    },
    {
      'image': 'assets/images/287_108.png',
      'name': 'Pixsellz',
      'message': 'Make design process easier…',
      'isAd': true,
      'adImage': 'assets/images/287_115.png'
    },
    {
      'image': 'assets/images/287_5.png',
      'name': 'Maximillian Jacobson',
      'message': 'Messenger UI · Thu',
      'isRead': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
            child: AppBar(
              backgroundColor: Colors.white.withOpacity(0.75),
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/287_84.png'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Chats',
                        style: GoogleFonts.getFont(
                          'SF Pro Display',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0.4,
                        ),
                      ),
                      const Spacer(),
                      _buildAppBarIcon(Icons.camera_alt_outlined),
                      const SizedBox(width: 16),
                      _buildAppBarIcon(Icons.edit_outlined),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 50,
            flexibleSpace: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.getFont(
                    'SF Pro Text',
                    color: const Color(0xFF8E8E93),
                    fontSize: 17,
                    letterSpacing: -0.41,
                  ),
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xFF8E8E93)),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.05),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 106,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: _stories.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return _buildAddStory();
                  final story = _stories[index - 1];
                  return _buildStoryItem(
                      story['image'], story['name'], story['isOnline']);
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final chat = _chats[index];
                if (chat['isAd'] == true) {
                  return _buildAdItem(
                      chat['image'],
                      chat['name'],
                      chat['message'],
                      chat['adImage']);
                }
                return _buildChatItem(
                    chat['image'], chat['name'], chat['message'], chat['isRead']);
              },
              childCount: _chats.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            context.go('/messanger_people');
          }
        },
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFA3A9B2),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.people),
                Positioned(
                  right: -5,
                  top: -3,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF5AD439).withOpacity(0.16),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '2',
                      style: GoogleFonts.getFont(
                        'SF Pro Text',
                        color: const Color(0xFF5AD439),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'People',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Discover',
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.black, size: 22),
    );
  }

  Widget _buildAddStory() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.black, size: 24),
            ),
            const SizedBox(height: 7),
            Text(
              'Your story',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'SF Pro Text',
                color: Colors.black.withOpacity(0.35),
                fontSize: 13,
                letterSpacing: -0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoryItem(String imagePath, String name, bool isOnline) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage(imagePath),
                ),
                if (isOnline)
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        color: const Color(0xFF5AD439),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.getFont(
                'SF Pro Text',
                color: Colors.black.withOpacity(0.35),
                fontSize: 13,
                letterSpacing: -0.08,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatItem(
      String imagePath, String name, String message, bool isRead) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.getFont(
                      'SF Pro Text',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.getFont(
                      'SF Pro Text',
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      letterSpacing: -0.15,
                    ),
                  ),
                ],
              ),
            ),
            if (isRead)
              const Icon(
                Icons.done_all,
                color: Color(0xFFC2C5CC),
                size: 16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdItem(
      String imagePath, String name, String message, String adImagePath) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.getFont(
                          'SF Pro Text',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: -0.4,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'Ad',
                          style: GoogleFonts.getFont(
                            'SF Pro Text',
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.getFont(
                      'SF Pro Text',
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5),
                      letterSpacing: -0.15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'View More',
                    style: GoogleFonts.getFont(
                      'SF Pro Text',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0084FD),
                      letterSpacing: -0.15,
                    ),
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                adImagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}