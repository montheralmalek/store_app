import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_cubit.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_states_cubit.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_cubit.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_states.dart';
import 'package:store_app/widgets/bottom_navbar_items.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    super.key,
    this.onTap,
  });

  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePagesCubit, HomePagesStates>(
      builder: (context, state) {
        return CurvedNavigationBar(
          index: BlocProvider.of<HomePagesCubit>(context).getIndex,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          color: Theme.of(context).colorScheme.primary,
          animationDuration: const Duration(milliseconds: 400),
          onTap: onTap,
          items: [
            //**------------------ Home Button ------------------ */
            const BNavBarItem(
              icon: Icons.home_outlined,
              label: 'Home',
            ),
            //**------------------ Categories Button ------------------ */
            const BNavBarItem(
              icon: Icons.category_outlined,
              label: 'Categories',
            ),
            //**------------------ Favorit Buttone ------------------ */
            BlocBuilder<FavoriteCubit, FavoriteCubitStates>(
              builder: (context, state) {
                return BNavBarItem(
                  icon: Icons.favorite_outline,
                  label: 'Favorite',
                  notification: state is FavoriteCubitHasDataState
                      ? state.items.length
                      : null,
                );
              },
            ),
            //**------------------ Account Button ------------------ */
            const BNavBarItem(
              icon: Icons.account_circle_outlined,
              label: 'Account',
            ),
          ],
        );
      },
    );
  }
}
