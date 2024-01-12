import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:store_app/cubits/get_all_products/get_all_products_cubit_states.dart';
import 'package:store_app/widgets/categories_listview_builder.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/image_carousel_slider.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class HomeBodyBiulder extends StatelessWidget {
  const HomeBodyBiulder({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
              builder: (context, state) {
            if (state is GetAllCategoriesInitialState) {
              BlocProvider.of<GetAllCategoriesCubit>(context)
                  .getAllCategoreis();
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAllCategoriesLoadedState) {
              return Column(
                children: [
                  ImageCarouselSlider(
                    imageList: state.categoriesList!,
                  ),
                  Container(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    margin: bodymargin,
                    padding: bodyPadding,
                    child: const CategoriesListViewBuilder(),
                  )
                ],
              );
            } else {
              return FailureLoad(
                error: state is GetAllCategoriesFailureLoadState
                    ? state.error
                    : 'Something Is Erorr!',
                onPressed: () => BlocProvider.of<GetAllCategoriesCubit>(context)
                    .refereshData(),
              );
            }
          }),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          sliver: BlocBuilder<GetAllProductsCubit, GetAllProductsStates>(
            builder: (context, state) {
              if (state is GetAllProductsInitialState) {
                BlocProvider.of<GetAllProductsCubit>(context).getAllProducts();
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ); //Text('HomeDataInitialState');
              } else if (state is GetAllProductsLoadedState) {
                return ProductsListViewBuilder(
                    productsList: state.productsList);
              } else {
                return SliverToBoxAdapter(
                  child: FailureLoad(
                    error: state is GetAllProductsFailureLoadState
                        ? state.error
                        : 'Something Is Erorr!',
                    onPressed: () =>
                        BlocProvider.of<GetAllProductsCubit>(context)
                            .refereshData(),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
