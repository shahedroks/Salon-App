import 'package:flutter/material.dart';

class CustomNavigetorBar extends StatelessWidget {
  int _currentIndex;

  var goToButttonNevigationPage;
  CustomNavigetorBar({
    super.key,
    required int currentIndex,
    required this.goToButttonNevigationPage,
  }) : _currentIndex = currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => goToButttonNevigationPage(index),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.markunread_outlined),
          label: 'Massage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
