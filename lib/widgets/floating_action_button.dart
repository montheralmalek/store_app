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
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.chat,
          size: 32,
          //color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () => Navigator.pushNamed(context, AddProductView.id),
      ),
    );
  }
}
