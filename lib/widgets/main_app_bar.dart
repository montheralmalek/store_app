import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
import 'package:store_app/views/cart_view.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text('New Trend'),
      actions: [
        const Icon(
          Icons.search,
          size: 26,
        ),
        BlocBuilder<CartCubit, CartCubitStates>(
          builder: (context, state) {
            int? itemsCount =
                state is CartCubitHasDataState ? state.items.length : null;
            return Stack(
              children: [
                //**-----------start cart button ------------------ */
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, CartView.id),
                  icon: const Icon(Icons.shopping_cart_outlined),
                ),
                //**----------- Start Notification -----------------*/
                if (itemsCount != null)
                  Positioned(
                    top: -5,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$itemsCount',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
      leading: const Icon(
        Icons.list,
        size: 32,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 25,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.background, //.withOpacity(0.9),
              border: Border.all(
                  color: Theme.of(context).colorScheme.background, width: 0),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
        ),
      ),
    );
  }
}
