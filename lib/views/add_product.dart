import 'package:flutter/material.dart';

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
      body: const Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: AddProductForm(),
        ),
      ),
    );
  }
}
