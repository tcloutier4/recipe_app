import 'package:flutter/material.dart';

class ViewRecipeBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onTap;

  const ViewRecipeBottomNavBar(
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
            Icons.lunch_dining,
          ),
          label: 'Ingredients',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
          ),
          label: 'Instructions',
        ),
      ],
    );
  }
}
