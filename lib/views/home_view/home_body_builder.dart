import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/cubits/get_home_data/get_home_data_cubit.dart';
import 'package:store_app/cubits/get_home_data/home_data_cubit_states.dart';
import 'package:store_app/widgets/categories_listview_builder.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/image_carousel_slider.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class HomeBodyBiulder extends StatelessWidget {
  const HomeBodyBiulder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetHomeDataCubit, HomeDataStates>(
        builder: (context, state) {
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
              child: Container(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                margin: bodymargin,
                padding: bodyPadding,
                child: CategoriesListViewBuilder(
                  categoriesList: state.categoriesList!,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                  BlocProvider.of<GetHomeDataCubit>(context).refereshData(),
            ),
          ),
        );
      }
    });
  }
}
