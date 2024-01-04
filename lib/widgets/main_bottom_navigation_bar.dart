import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store_app/widgets/bottom_navbar_items.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    this.selectedItem = 0,
    this.onTap,
  });

  final int selectedItem;
  final Function(int)? onTap;

  @override
  CurvedNavigationBar build(BuildContext context) {
    return CurvedNavigationBar(
      index: selectedItem,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      color: Theme.of(context).colorScheme.primary,
      animationDuration: const Duration(milliseconds: 400),
      onTap: onTap,
      items: const [
        BottomNavigationBarItems(
          icon: Icons.home_outlined,
          label: 'Home',
        ),
        BottomNavigationBarItems(
          icon: Icons.shop_outlined,
          label: 'Products',
        ),
        BottomNavigationBarItems(
          icon: Icons.shopping_cart_outlined,
          label: 'Cart',
        ),
        BottomNavigationBarItems(
          icon: Icons.favorite_outline,
          label: 'Favorite',
        ),
      ],
    );
  }
}
