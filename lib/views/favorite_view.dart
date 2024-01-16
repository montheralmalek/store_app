import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_cubit.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_states_cubit.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class FavoritView extends StatelessWidget {
  const FavoritView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteCubitStates>(
      builder: (context, state) {
        if (state is FavoriteCubitHasDataState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // --------------- Header --------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Favorite',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(intWithString(state.items.length, 'item')),
                  ],
                ),
                //**--------------- items -------------------------- */
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      ProductsListViewBuilder(productsList: state.items),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text('No items'),
          );
        }
      },
    );
  }
}
