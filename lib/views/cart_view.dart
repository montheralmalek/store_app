import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/cart_cubit/cart_states_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/views/product_view.dart';
import 'package:store_app/widgets/minus_add_textfield_widget.dart';

class CartView extends StatelessWidget {
  static String id = 'Cart View';
  const CartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitStates>(
      builder: (context, state) {
        if (state is CartCubitHasDataState) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  // --------------- Header --------------------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cart',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(intWithString(state.items.length, 'item')),
                    ],
                  ),
                  const Divider(),
                  // --------------- Get your products --------------------
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 50,
                    decoration: BoxDecoration(
                        //color: Colors.amber,
                        border: Border.all(width: 0.3),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Container(
                                color: Colors.blueGrey.shade50,
                                height: double.infinity,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: const Text(
                                  'Total Price:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              // const Gap(5),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${state.totalPrice} ' '\$',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                                minimumSize: Size.infinite,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                )),
                            // style: ButtonStyle(
                            //   minimumSize:
                            //       MaterialStateProperty.all(Size.infinite),

                            // ),
                            onPressed: () {},
                            child: const Text('Get your products'),
                            //icon: Icon(Icons.get_app),
                          ),
                          // child: CustomButton(
                          //   borderRadius: BorderRadius.circular(10),
                          //   text: const Text('Get your products'),
                          //   onTap: () {},
                          // ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // ---------------Start Items --------------------------------
                  // --------------- ------------- ---------------------- ---
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final TextEditingController qtyController =
                            TextEditingController();
                        qtyController.text =
                            state.items[index].quantity.toString();
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<GetCustomProductsCubit>(context)
                                .refereshData();
                            BlocProvider.of<GetCustomProductsCubit>(context)
                                .getCustomProducts(
                                    category:
                                        state.items[index].product.category);
                            Navigator.pushNamed(context, ProductView.id,
                                arguments: state.items[index].product);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
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
                                  image: NetworkImage(
                                      state.items[index].product.img),
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
                                                state
                                                    .items[index].product.title,
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
                                                size: 28,
                                              ),
                                              onPressed: () {
                                                BlocProvider.of<CartCubit>(
                                                        context)
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            MinusAddTextFieldWidget(
                                              controller: qtyController,
                                              index: index,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('No Items'),
            ),
          );
        }
      },
    );
  }
}
