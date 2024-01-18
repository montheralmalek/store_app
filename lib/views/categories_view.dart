import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit_states.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/views/category_product_view.dart';
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
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  padding: const EdgeInsets.all(10),
                  itemCount: state.categoriesList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<GetCustomProductsCubit>(context)
                            .refereshData();
                        BlocProvider.of<GetCustomProductsCubit>(context)
                            .getCustomProducts(
                                category: state.categoriesList![index].name);
                        Navigator.pushNamed(context, CategoryProductsView.id,
                            arguments: state.categoriesList![index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey.shade200,
                            )
                          ],
                        ),
                        child: Column(children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      state.categoriesList![index].img),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(7),
                                      bottomRight: Radius.circular(7))),
                              child: Text(
                                state.categoriesList![index].name,
                              ),
                            ),
                          ),
                        ]),
                      ),
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
