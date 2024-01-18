import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_cubit.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_states.dart';
import 'package:store_app/views/account_view.dart';
import 'package:store_app/views/categories_view.dart';
import 'package:store_app/views/favorite_view.dart';
import 'package:store_app/views/home_view/home_body_builder.dart';
import 'package:store_app/widgets/floating_action_button.dart';
import 'package:store_app/widgets/main_app_bar.dart';
import 'package:store_app/widgets/main_bottom_navigation_bar.dart';

class HomeView extends StatefulWidget {
  static String id = 'homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MainAppBar(),
      ),
      body: BlocBuilder<HomePagesCubit, HomePagesStates>(
        builder: (context, state) {
          return PageView.builder(
              onPageChanged: (value) => BlocProvider.of<HomePagesCubit>(context)
                  .setSelectedIndex(value),
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const HomeBodyBiulder();
                } else if (index == 1) {
                  return const CategoriesView();
                } else if (index == 2) {
                  return const FavoritView(); //const CartView();
                } else {
                  return const AccountView();
                }
              });
        },
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        onTap: (value) {
          BlocProvider.of<HomePagesCubit>(context).setSelectedIndex(value);
          _pageController.jumpToPage(value);
        },
      ),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
