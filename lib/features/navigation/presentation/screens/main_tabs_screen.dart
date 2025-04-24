import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repo_game/features/challenges/presentation/screens/challenges_screen.dart';
import 'package:repo_game/features/home/presentation/screens/home_screen.dart';
import 'package:repo_game/features/navigation/presentation/widgets/bottom_navigation_bar.dart';
import 'package:repo_game/features/profile/presentation/screens/profile_screen.dart';
import 'package:repo_game/features/pvp/presentation/screens/pvp_screen.dart';

@RoutePage()
class MainTabsScreen extends StatefulWidget {
  const MainTabsScreen({super.key});

  @override
  State<MainTabsScreen> createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ChallengesScreen(),
    const PvpScreen(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
} 
