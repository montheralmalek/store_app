import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit_states.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/widgets/circular_icon_button.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class CategoryProductsView extends StatefulWidget {
  static String id = 'Category Products View';

  const CategoryProductsView({super.key});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: ,
            automaticallyImplyLeading: false,
            centerTitle: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(category.img),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularIconButton(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  icon: Icons.clear,
                  onPressed: () => Navigator.pop(context),
                ),
                CircularIconButton(
                  backgroundColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  icon: Icons.search,
                  onPressed: () {},
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, //.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Text(
                  category.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver:
                BlocBuilder<GetCustomProductsCubit, GetCustomProductsStates>(
              builder: (context, state) {
                if (state is GetCustomProductsInitialState) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ); //Text('HomeDataInitialState');
                } else if (state is GetCustomProductsLoadedState) {
                  return ProductsListViewBuilder(
                      productsList: state.productsList);
                } else {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: FailureLoad(
                          error: state is GetCustomProductsFailureState
                              ? state.error
                              : 'Something Is Erorr!',
                          onPressed: () =>
                              BlocProvider.of<GetCustomProductsCubit>(context)
                                  .getCustomProducts(category: category.name),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
