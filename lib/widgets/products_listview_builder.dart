import 'package:flutter/material.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_products_service.dart';
import 'package:store_app/widgets/item_card.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({
    super.key,
    this.category,
  });
  final String? category;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: GetProducts().getData(categoryName: category),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 4 / 5,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemCrad(product: snapshot.data![index]);
            },
          );
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(child: snapshotError(snapshot, context));
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
