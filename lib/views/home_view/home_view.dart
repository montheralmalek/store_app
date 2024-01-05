import 'package:flutter/material.dart';
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

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: MainAppBar(),
      ),
      bottomNavigationBar: MainBottomNavigationBar(
        selectedItem: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
            _pageController.jumpToPage(value);
          });
        },
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: 4,
          onPageChanged: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HomeBodyBiulder();
            } else if (index == 1) {
              return Center(
                child: Text(
                  'products page $index',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w800),
                ),
              );
            } else if (index == 2) {
              return Center(
                child: Text(
                  'cart page $index',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w800),
                ),
              );
            } else {
              return Center(
                child: Text(
                  'favorite page $index',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w800),
                ),
              );
            }
          }),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class HomeInitial extends StatelessWidget {
  const HomeInitial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
