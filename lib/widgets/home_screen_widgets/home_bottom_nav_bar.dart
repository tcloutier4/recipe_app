import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onTap;

  const HomeBottomNavBar(
    Key? key,
    this.selectedIndex,
    this.onTap,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      currentIndex: selectedIndex,
      onTap: onTap,
      selectedFontSize: 16,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.menu_book,
          ),
          label: 'Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.calendar_month,
          ),
          label: 'Meal Plan',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt,
          ),
          label: 'Groceries',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
