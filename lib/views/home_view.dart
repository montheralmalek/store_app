import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_home_data/get_home_data_cubit.dart';
import 'package:store_app/cubits/get_home_data/home_data_cubit_states.dart';
import 'package:store_app/widgets/categories_listview_builder.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/floating_action_button.dart';
import 'package:store_app/widgets/image_carousel_slider.dart';
import 'package:store_app/widgets/main_app_bar.dart';
import 'package:store_app/widgets/main_bottom_navigation_bar.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

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
      body: BlocBuilder<GetHomeDataCubit, HomeDataStates>(
        builder: (context, state) {
          return PageView.builder(
              controller: _pageController,
              itemCount: 4,
              onPageChanged: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  if (state is HomeDataInitialState) {
                    BlocProvider.of<GetHomeDataCubit>(context).getHomeData();
                    return const Center(
                      child: CircularProgressIndicator(),
                    ); //Text('HomeDataInitialState');
                  } else if (state is SuccessLoadedState) {
                    return CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: ImageCarouselSlider(
                            imageList: state.categoriesList!,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: CategoriesListViewBuilder(
                              categoriesList: state.categoriesList!,
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          sliver: ProductsListViewBuilder(
                            productsList: state.productsList,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FailureLoad(
                          error: state is FailureLoadState
                              ? state.error
                              : 'Something Is Erorr!',
                          onPressed: () =>
                              BlocProvider.of<GetHomeDataCubit>(context)
                                  .getHomeData(),
                        ),
                      ),
                    );
                  }
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
              });
        },
      ),
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
