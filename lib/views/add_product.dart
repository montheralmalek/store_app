import 'package:flutter/material.dart';

import 'package:store_app/services/get_categories_service.dart';
import 'package:store_app/widgets/add_product_form.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({
    super.key,
    //required this.product,
  });
  static String id = 'Add Product';

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  List<String> categoryList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AddProductView.id),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: GetCategories().getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (categoryList.isEmpty) {
                    for (var item in snapshot.data!) {
                      categoryList.add(item.name);
                    }
                  }
                  // dropdownValue = categoryList.first;
                  return AddProductForm(categoryList: categoryList);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ),
    );
  }
}
