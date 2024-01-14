import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
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
      items: [
        const BNavBarItem(
          icon: Icons.home_outlined,
          label: 'Home',
        ),
        const BNavBarItem(
          icon: Icons.shop_outlined,
          label: 'Products',
        ),
        BlocBuilder<CartCubit, CartCubitStates>(
          builder: (context, state) {
            return BNavBarItem(
              icon: Icons.shopping_cart_outlined,
              label: 'Cart',
              notification:
                  state is CartCubitHasDataState ? state.items.length : null,
            );
          },
        ),
        const BNavBarItem(
          icon: Icons.favorite_outline,
          label: 'Favorite',
        ),
      ],
    );
  }
}
