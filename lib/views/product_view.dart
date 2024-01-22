import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:share/share.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit_states.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/custom_icon_button.dart';
import 'package:store_app/widgets/color_radio_list.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/failure_load.dart';
import 'package:store_app/widgets/favorite_icon_button.dart';
import 'package:store_app/widgets/minus_add_textfield_widget.dart';
import 'package:store_app/widgets/products_listview_builder.dart';
import 'package:store_app/widgets/rate_product_show_widget.dart';

class ProductView extends StatefulWidget {
  static String id = 'Product View';

  const ProductView({
    super.key,
  });

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController _quantity = TextEditingController();
  late ProductModel product;
  final Color _highlightColor = Colors.blueGrey.shade50;

  @override
  Widget build(BuildContext context) {
    // _highlightColor = Colors.deepPurple;
    product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //**------------- Title ------------------*/
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: _highlightColor,
                        border: Border.all(color: _highlightColor),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Text(
                      product.title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  //const Gap(10),
                  // const Divider(),
                  //**------------- Image ------------------*/
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(
                            color: _highlightColor,
                          ),
                        ),
                      ),
                      child: Image(
                        image: NetworkImage(product.img),
                        height: 200,
                      ),
                    ),
                  ),
                  //**------------- Price and Rate ------------------*/
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    decoration: BoxDecoration(
                      color: _highlightColor,
                      border: Border.all(color: _highlightColor),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    child: Row(
                      children: [
                        //**------------- Price ------------------*/
                        Text(
                          ' ${product.price} \$',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          '${product.price}  \$',
                          style: const TextStyle(fontSize: 16),
                        ),
                        //**------------- Rate ------------------*/
                        const Expanded(child: SizedBox()),
                        const RateProductShowWidget(
                          rateValue: 4.5,
                        ),
                        //** ----------- Favorite Button ----------- */
                        FavoriteIconButton(
                          product: product,
                          iconSize: 18,
                          size: 30,
                        ),
                        //** ----------- Share Button ----------- */
                        CircularIconButton(
                          icon: Icons.share,
                          iconSize: 18,
                          size: 30,
                          onPressed: _onShare,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  //**------------- colors ------------------*/
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
                          Colors.grey.value,
                          Colors.white.value,
                          Colors.black.value
                        ]),
                      )
                    ],
                  ),
                  const Divider(),
                  //**------------- Category ------------------*/
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Text(
                      'Category:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Gap(5),
                    Text(
                      product.category,
                    ),
                  ]),
                  const Divider(),
                  //**------------- Description ------------------*/
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
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
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
      //--------------- End see also -------------------
      //-------------------------------------------------------
      //--------------- Start bottom navigationbar ------------------------
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: MinusAddTextFieldWidget(controller: _quantity)),
            // ------------------ Add To Cart Button ---------------
            Expanded(
              child: CustomButton(
                borderRadius: BorderRadius.circular(10),
                height: 48,
                text: const Text('Add to cart'),
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  BlocProvider.of<CartCubit>(context).addItem(
                      product: product, quantity: int.parse(_quantity.text));
                  addToCartDialog(context, product, int.parse(_quantity.text));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onShare() async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
      product.img,
      subject: 'new',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}
