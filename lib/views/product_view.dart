import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit_states.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/color_radio_list.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class ProductView extends StatelessWidget {
  static String id = 'Product View';

  const ProductView({
    super.key,
  });
  //final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      product.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  //const Gap(10),
                  const Divider(),
                  Image(
                    image: NetworkImage(product.img),
                    height: 200,
                  ),
                  // SizedBox(width: double.maxFinite, child: Text('${product.price}')),
                  Row(
                    children: [
                      Text(
                        ' ${product.price}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                        ),
                      ),
                      const Gap(5),
                      Text('${product.price}  \$')
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Color:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Gap(10),
                      Expanded(
                        child: ColorRadioList(colorsList: [
                          Colors.amber.value,
                          Colors.green.value,
                          Colors.black.value
                        ]),
                      )
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('Description'),
                    subtitle: ExpandableText(
                      product.description,
                      expandText: 'Show more',
                      collapseText: 'Show less',
                      maxLines: 3,
                      linkColor: Colors.blueAccent,
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            //--------------- End product details -------------------
            //-------------------------------------------------------
            //--------------- Start see also ------------------------

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('See also',
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
            ),
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
                                  .getCustomProducts(
                                      category: product.category),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Container(
            height: 100,
            //width: double.infinity,
            color: Colors.amber,
            child: Column(
              children: [
                CustomButton(
                  height: 48,
                  text: const Text('Add to cart'),
                  icon: const Icon(Icons.add_shopping_cart),
                  onTap: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
