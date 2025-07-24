import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AppMainScreen extends StatefulWidget {
  final Widget child;
  const AppMainScreen({super.key, required this.child});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int _currentIndex = 0;
  final tabs = ['/home', '/news', '/rank', '/teams', '/home'];

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    // List of paths where bottom nav should be hidden
    final hideBottomNavPaths = ['/onboarding'];

    final shouldHideBottomNav = hideBottomNavPaths.any(
      (path) => currentLocation.startsWith(path),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          widget.child,
          if (!shouldHideBottomNav)
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildNavItems(Iconsax.home_15, "A", 0),
                    _buildNavItems(CupertinoIcons.news, "B", 1),
                    _buildNavItems(Iconsax.crown, "C", 3),
                    _buildNavItems(Iconsax.people, "D", 4),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNavItems(IconData icon, String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });

        context.go(tabs[index]);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color: _currentIndex == index ? Colors.red : Colors.grey,
          ),
          // SizedBox(height: 3),
          // CircleAvatar(
          //   radius: 3,
          //   backgroundColor:
          //       _currentIndex == index ? Colors.red : Colors.transparent,
          // ),
        ],
      ),
    );
  }
}
