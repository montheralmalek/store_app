import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/widgets/category_card_widget.dart';
import 'package:store_app/widgets/failure_load.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesStates>(
      builder: (context, state) {
        if (state is GetAllCategoriesInitialState) {
          BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategoreis();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllCategoriesLoadedState) {
          return Column(
            children: [
              Text(
                'All Categories',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisExtent: 200,
                    //childAspectRatio: 5 / 6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: state.categoriesList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCardWidget(
                      category: state.categoriesList![index],
                      height: 100,
                      circularRadius: 10,
                    );
                  },
                ),
              ),
            ],
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
