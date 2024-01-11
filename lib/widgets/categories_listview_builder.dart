import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/widgets/category_card_widget.dart';
import 'package:store_app/widgets/failure_load.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
      builder: (context, state) {
        if (state is GetAllCategoriesInitialState) {
          BlocProvider.of<GetAllCategoriesCubit>(context).getHomeData();
          return const Center(
            child: CircularProgressIndicator(),
          ); //Text('HomeDataInitialState');
        } else if (state is GetAllCategoriesLoadedState) {
          return Container(
            height: 112,
            // color: Theme.of(context).colorScheme.background,
            padding: const EdgeInsets.symmetric(vertical: 6),
            //color: const Color(0xffffaa66),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categoriesList!.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    CategoryCardWidget(
                      category: state.categoriesList![index],
                      width: 100,
                    ),
                    const Gap(10),
                  ],
                );
              },
            ),
          );
        } else {
          return FailureLoad(
            error: state is GetAllCategoriesFailureLoadState
                ? state.error
                : 'Something Is Erorr!',
            onPressed: () =>
                BlocProvider.of<GetAllCategoriesCubit>(context).refereshData(),
          );
        }
      },
    );
  }
}
