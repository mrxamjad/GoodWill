import 'package:flutter/material.dart';
import 'package:good_will/screens/HomeScreen.dart';
import 'package:good_will/screens/MatchScreen.dart';
import 'package:good_will/screens/ProfileScreen.dart';
import 'package:good_will/screens/WalletScreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

/// Flutter code sample for [BottomNavigationBar].

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const WalletScreen(),
    const MatchScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
        // rippleColor: Colors.grey[300]!,
        // hoverColor: Colors.grey[100]!,
        gap: 8,

        curve: Curves.easeOut,
        activeColor: Colors.white,
        iconSize: 28,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Colors.teal,
        backgroundColor: Colors.teal[100]!,
        color: Colors.teal,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.currency_rupee,
            text: 'Wallet',
          ),
          GButton(
            icon: Icons.games,
            text: 'Games',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
