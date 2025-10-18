import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

class MessangerPeople extends StatelessWidget {
  const MessangerPeople({super.key});

  final List<_PersonData> people = const [
    _PersonData(
        name: 'Martha Craig',
        imageUrl: 'assets/images/287_380.png',
        statusType: 'online',
        statusText: ''),
    _PersonData(
        name: 'Kieron Dotson',
        imageUrl: 'assets/images/287_404.png',
        statusType: 'away',
        statusText: '8 min.'),
    _PersonData(
        name: 'Zack John',
        imageUrl: 'assets/images/287_418.png',
        statusType: 'away',
        statusText: '10 min.'),
    _PersonData(
        name: 'Jamie Franco',
        imageUrl: 'assets/images/287_392.png',
        statusType: 'online',
        statusText: ''),
    _PersonData(
        name: 'Tabitha Potter',
        imageUrl: 'assets/images/287_432.png',
        statusType: 'away',
        statusText: '10 min.'),
    _PersonData(
        name: 'Albert Lasker',
        imageUrl: 'assets/images/287_447.png',
        statusType: 'away',
        statusText: '30 min.'),
  ];

  @override
  Widget build(BuildContext context) {
    const int recentlyActiveStartIndex = 5;
    final List<_PersonData> mainList = people.sublist(0, recentlyActiveStartIndex);
    final List<_PersonData> recentlyActiveList = people.sublist(recentlyActiveStartIndex);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: _buildYourStoryTile(),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _PersonTile(data: mainList[index]);
              },
              childCount: mainList.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
              child: Text(
                'Recently active'.toUpperCase(),
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.34),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _PersonTile(data: recentlyActiveList[index]);
              },
              childCount: recentlyActiveList.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(140),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            color: Colors.white.withOpacity(0.8),
            child: Column(
              children: [
                SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/287_483.png'),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'People',
                          style: GoogleFonts.urbanist(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),
                        _buildAppBarIconButton(Icons.chat_bubble_outline),
                        const SizedBox(width: 8),
                        _buildAppBarIconButton(Icons.person_add_alt_1),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.urbanist(
                        color: const Color(0xFF8E8E93),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xFF8E8E93)),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.05),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBarIconButton(IconData icon) {
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

  Widget _buildYourStoryTile() {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.black),
      ),
      title: Text(
        'Your story',
        style: GoogleFonts.urbanist(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        'Add to your story',
        style: GoogleFonts.urbanist(
          fontSize: 13,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.toString();
    int currentIndex = 1;
    if (currentPath == '/messanger_chats') {
      currentIndex = 0;
    } else if (currentPath == '/messanger_people') {
      currentIndex = 1;
    } else if (currentPath == '/messanger_swipe_actions') {
      currentIndex = 2;
    }

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.5),
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                  context.go('/messanger_chats');
                  break;
                case 1:
                  context.go('/messanger_people');
                  break;
                case 2:
                  context.go('/messanger_swipe_actions');
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: '',
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey.shade600,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

class _PersonTile extends StatelessWidget {
  final _PersonData data;

  const _PersonTile({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(data.imageUrl),
              ),
              if (data.statusType == 'online')
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF5AD43A),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              if (data.statusType == 'away')
                Positioned(
                  bottom: -4,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC7F0BA),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                      child: Text(
                        data.statusText,
                        style: GoogleFonts.urbanist(
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          title: Text(
            data.name,
            style: GoogleFonts.urbanist(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          trailing: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.07),
                shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.waving_hand_outlined,
                  size: 16, color: Colors.black),
              onPressed: () {},
            ),
          ),
          onTap: () {},
        ),
        Padding(
          padding: const EdgeInsets.only(left: 76.0, right: 16.0),
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.black.withOpacity(0.12),
          ),
        ),
      ],
    );
  }
}

class _PersonData {
  final String name;
  final String imageUrl;
  final String statusType; // 'online', 'away'
  final String statusText;

  const _PersonData({
    required this.name,
    required this.imageUrl,
    required this.statusType,
    required this.statusText,
  });
}