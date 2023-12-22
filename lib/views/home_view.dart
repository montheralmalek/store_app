import 'package:flutter/material.dart';
import 'package:store_app/widgets/categories_listview_builder.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class HomeView extends StatelessWidget {
  static String id = 'homeView';

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        actions: const [
          Icon(
            Icons.search,
            size: 26,
          )
        ],
        leading: const Icon(
          Icons.list,
          size: 32,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CategoriesListViewBuilder(),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              width: double.maxFinite,
              color: Theme.of(context).colorScheme.primary,
              child: Container(
                height: 30,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            sliver: ProductsListViewBuilder(),
          ),
        ],
      ),
    );
  }
}
