import 'package:flutter/material.dart';
import 'package:recipe_app/shared/constants.dart';

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
      elevation: 0.0,
      currentIndex: selectedIndex,
      onTap: onTap,
      backgroundColor: colorBrown,
      selectedItemColor: colorFloralWhite,
      unselectedItemColor: Colors.black,
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
      ],
    );
  }
}
