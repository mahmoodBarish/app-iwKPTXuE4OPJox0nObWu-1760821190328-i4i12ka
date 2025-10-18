import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'dart:ui';

class MessangerSwipeActions extends StatelessWidget {
  const MessangerSwipeActions({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_StoryData> stories = [
      _StoryData(
          name: 'Your story',
          imageUrl: '',
          isAdd: true,
          isOnline: false),
      _StoryData(
          name: 'Joshua',
          imageUrl: 'assets/images/287_264.png',
          isOnline: true),
      _StoryData(
          name: 'Martin',
          imageUrl: 'assets/images/287_269.png',
          isOnline: true),
      _StoryData(
          name: 'Karen',
          imageUrl: 'assets/images/287_274.png',
          isOnline: true),
      _StoryData(
          name: 'Martha',
          imageUrl: 'assets/images/287_279.png',
          isOnline: true),
      _StoryData(
          name: 'Andrew',
          imageUrl: 'assets/images/287_207.png',
          isOnline: false),
    ];

    final List<_ChatData> chats = [
      _ChatData(
        name: 'Martin Randolph',
        message: 'You: What’s man! · 9:40 AM',
        imageUrl: 'assets/images/287_242.png',
        hasRead: true,
      ),
      _ChatData(
        name: 'Andrew Parker',
        message: 'You: Ok, thanks! · 9:25 AM',
        imageUrl: 'assets/images/287_207.png',
        hasRead: true,
      ),
      _ChatData(
        name: 'Maisy Humphrey',
        message: 'Have a good day, Jacob! · Fri',
        imageUrl: 'assets/images/287_217.png',
        hasRead: true,
      ),
      _ChatData(
        name: 'Karen Castillo',
        message: 'You: Ok, See you in To… · Fri',
        imageUrl: 'assets/images/287_227.png',
        hasRead: true,
      ),
      _ChatData(
        name: 'Joshua Lawrence',
        message: 'The business plan loo… · Thu',
        imageUrl: 'assets/images/287_251.png',
        hasRead: false,
      ),
      _ChatData(
        name: 'Pixsellz',
        message: 'Make design process easier…',
        imageUrl: 'assets/images/287_310.png',
        isAd: true,
        adImageUrl: 'assets/images/287_317.png',
      ),
      _ChatData(
        name: 'Maximillian Jacobson',
        message: 'Messenger UI · Thu',
        imageUrl: 'assets/images/287_237.png',
        hasRead: false,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(context),
          _buildStories(stories),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return _ChatItem(chat: chats[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage:
                            AssetImage('assets/images/287_286.png'),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Chats',
                        style: GoogleFonts.inter(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      _AppBarIconButton(
                        icon: Icons.camera_alt_outlined,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      _AppBarIconButton(
                        icon: Icons.edit_outlined,
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 17,
                          color: const Color(0xFF8E8E93),
                        ),
                        prefixIcon: const Icon(Icons.search,
                            color: Color(0xFF8E8E93)),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.05),
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStories(List<_StoryData> stories) {
    return Container(
      color: Colors.white,
      height: 106,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return _StoryItem(story: stories[index]);
        },
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 86,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: Colors.grey[300]!, width: 0.5),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BottomNavBarItem(
                  icon: Icons.chat_bubble,
                  label: 'Chats',
                  isActive: currentPath == '/messanger_swipe_actions',
                  onTap: () => context.go('/messanger_swipe_actions'),
                ),
                _BottomNavBarItem(
                  icon: Icons.people,
                  label: 'People',
                  isActive: currentPath == '/messanger_people',
                  onTap: () => context.go('/messanger_people'),
                  hasBadge: true,
                ),
                _BottomNavBarItem(
                  icon: Icons.explore_outlined,
                  label: 'Discover',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ChatItem extends StatelessWidget {
  final _ChatData chat;

  const _ChatItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(chat.name),
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.65,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFC8C7CD),
            foregroundColor: Colors.black,
            icon: Icons.menu,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFC8C7CD),
            foregroundColor: Colors.black,
            icon: Icons.notifications_off,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFFF2D55),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.65,
        children: [
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFF0084FF),
            foregroundColor: Colors.white,
            icon: Icons.camera_alt,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFF6F6F6),
            foregroundColor: Colors.black,
            icon: Icons.call,
          ),
          SlidableAction(
            onPressed: (context) {},
            backgroundColor: const Color(0xFFF6F6F6),
            foregroundColor: Colors.black,
            icon: Icons.videocam,
          ),
        ],
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () => context.go('/messanger_chats'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(chat.imageUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            chat.name,
                            style: GoogleFonts.inter(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          if (chat.isAd)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 1),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                'Ad',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        chat.message,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      if (chat.isAd)
                        Text(
                          'View More',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0084FF),
                          ),
                        )
                    ],
                  ),
                ),
                if (chat.hasRead)
                  const Icon(Icons.check_circle,
                      color: Color(0xFFC2C5CC), size: 16)
                else if (chat.isAd && chat.adImageUrl != null)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      chat.adImageUrl!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StoryItem extends StatelessWidget {
  final _StoryData story;

  const _StoryItem({required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SizedBox(
        width: 65,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                if (story.isAdd)
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.04),
                    ),
                    child: const Icon(Icons.add, color: Colors.black, size: 24),
                  )
                else
                  CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(story.imageUrl),
                  ),
                if (story.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
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
              story.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 13,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _AppBarIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 22),
      ),
    );
  }
}

class _BottomNavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final bool hasBadge;
  final VoidCallback onTap;

  const _BottomNavBarItem({
    required this.icon,
    required this.label,
    this.isActive = false,
    this.hasBadge = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? Colors.black : const Color(0xFFA4AAB1);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: color, size: 28),
          if (hasBadge)
            Positioned(
              top: -4,
              right: -8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '2',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF5AD439),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _ChatData {
  final String name;
  final String message;
  final String imageUrl;
  final bool hasRead;
  final bool isAd;
  final String? adImageUrl;

  _ChatData(
      {required this.name,
      required this.message,
      required this.imageUrl,
      this.hasRead = false,
      this.isAd = false,
      this.adImageUrl});
}

class _StoryData {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool isAdd;

  _StoryData({
    required this.name,
    required this.imageUrl,
    this.isOnline = false,
    this.isAdd = false,
  });
}