import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_cubit.dart';
import 'package:store_app/cubits/home_pages_cubits/home_pages_states.dart';
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
              controller: _pageController,
              itemCount: 4,
              itemBuilder: (context, index) {
                if (state is InitialHomePageState) {
                  _pageController.jumpToPage(state.index);
                  return const HomeBodyBiulder();
                } else if (state is CategoriesHomePageState) {
                  _pageController.jumpToPage(state.index);
                  return Center(
                    child: Text(
                      'Categories page $index',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                  );
                } else if (state is FavoriteHomePageState) {
                  _pageController.jumpToPage(state.index);
                  return const FavoritView(); //const CartView();
                } else {
                  if (state is AccountHomePageState) {
                    _pageController.jumpToPage(state.index);
                  }
                  return Center(
                    child: Text(
                      'Account page $index',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w800),
                    ),
                  );
                }
              });
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
