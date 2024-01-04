import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widgets/item_card.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({
    super.key,
    this.category,
    required this.productsList,
  });
  final List<ProductModel> productsList;
  final String? category;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 4 / 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) {
        return ItemCrad(product: productsList[index]);
      },
    );
  }
}
