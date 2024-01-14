import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/minus_add_textfield_widget.dart';

class CartView extends StatelessWidget {
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitStates>(
      builder: (context, state) {
        if (state is CartCubitHasDataState) {
          return Column(
            children: [
              // --------------- Header --------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(BlocProvider.of<CartCubit>(context).count == 1
                        ? '${BlocProvider.of<CartCubit>(context).count} item'
                        : '${BlocProvider.of<CartCubit>(context).count} items'),
                  ],
                ),
              ),
              // --------------- Get your products --------------------
              SizedBox(
                width: 200,
                child: CustomButton(
                  borderRadius: BorderRadius.circular(10),
                  text: const Text('Get your products'),
                  onTap: () {},
                ),
              ),

              // --------------- Items --------------------------------
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final TextEditingController qtyController =
                        TextEditingController();
                    qtyController.text = state.items[index].quantity.toString();
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(8.0),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        //---------- Image ------------------------------
                        Container(
                          // color: Colors.white,
                          alignment: Alignment.center,
                          width: 120,
                          height: double.maxFinite,
                          child: Image(
                            image: NetworkImage(state.items[index].product.img),
                          ),
                        ),
                        const Gap(7),
                        //----------  ------------------------------
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //---------- Title ------------------------------
                                      Expanded(
                                        child: Text(
                                          state.items[index].product.title,
                                          style: const TextStyle(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      //---------- Delete bottun ------------------------------
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete_forever_outlined,
                                          color: Colors.red.shade600,
                                        ),
                                        onPressed: () {
                                          BlocProvider.of<CartCubit>(context)
                                              .removeItem(index);
                                        },
                                      ),
                                    ]),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    //-------------------- Price -----------------
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Gap(5),
                                          Text(
                                            'Price: ${state.items[index].product.price}',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                          ),
                                          Text(
                                            'Total: ${state.items[index].product.price * state.items[index].quantity}',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onBackground),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //----------------- Quantity ---------------------
                              Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MinusAddTextFieldWidget(
                                          controller: qtyController)
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}

// ListTile(
//                         minLeadingWidth: 100,
//                         subtitleTextStyle: TextStyle(
//                             color: Theme.of(context).colorScheme.onBackground),
//                         leading: Container(
//                           color: Colors.amber,
//                           alignment: Alignment.center,
//                           width: 120,
//                           height: 200,
//                           child: Image(
//                             image: NetworkImage(state.items[index].product.img),
//                           ),
//                         ),
//                         title: Text(state.items[index].product.title),
//                         subtitle: SizedBox(
//                           height: 80,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Price: ${state.items[index].product.price}',
//                                 style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground),
//                               ),
//                               const Gap(10),
//                               Text(
//                                 'Total: ${state.items[index].product.price * state.items[index].quantity}',
//                                 style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground),
//                               ),
//                             ],
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(
//                             Icons.delete_forever_outlined,
//                             color: Colors.red.shade600,
//                           ),
//                           onPressed: () {
//                             BlocProvider.of<CartCubit>(context)
//                                 .removeItem(index);
//                           },
//                         ),
//                       ),