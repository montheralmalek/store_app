import 'package:flutter/material.dart';
import 'package:store_app/views/add_product.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          size: 32,
        ),
        onPressed: () => Navigator.pushNamed(context, AddProductView.id),
      ),
    );
  }
}
