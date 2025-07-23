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
    // final hideBottomNavPaths = [
    //   '/foodDetails',
    //   '/viewAllProduct',
    //   '/signup',
    //   '/onboarding',
    // ];

    // final shouldHideBottomNav = hideBottomNavPaths.any(
    //   (path) => currentLocation.startsWith(path),
    // );
    return Scaffold(
      body: widget.child,
      bottomNavigationBar:
          Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 60,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItems(Iconsax.home_15, "A", 0),
                        _buildNavItems(CupertinoIcons.search, "B", 1),
                        SizedBox(width: 60),
                        _buildNavItems(Iconsax.notification, "C", 3),
                        _buildNavItems(
                          Iconsax.profile_2user,
                          "Profile",
                          4,
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 20,
                    left: MediaQuery.of(context).size.width / 2 - 30,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentIndex = 2;
                            });
                            context.go(tabs[2]);
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            radius: 30,
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Center(
                                    child: Icon(
                                      Iconsax.shopping_cart,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    top: -5,
                                    right: -5,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white
                                      ),
                                      constraints: BoxConstraints(
                                        minWidth: 20,
                                        minHeight: 20,
                                      ),
                                      child:  Text(
                                          '0',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
          SizedBox(height: 3),
          CircleAvatar(
            radius: 3,
            backgroundColor:
                _currentIndex == index ? Colors.red : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
