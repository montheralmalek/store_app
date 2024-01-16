import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/cart_view.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius,
    this.iconColor,
    this.quantity = 1,
  });
  final int quantity;
  final ProductModel product;
  final double? size, iconSize;
  final Color? backgroundColor, iconColor;
  final BoxShape boxShape;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        shape: boxShape,
        color: backgroundColor,
      ),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        color: iconColor,
        icon: const Icon(Icons.add_shopping_cart_outlined),
        onPressed: () {
          BlocProvider.of<CartCubit>(context)
              .addItem(product: product, quantity: quantity);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actionsAlignment: MainAxisAlignment.center,
                  iconColor: Colors.green,
                  icon: const Icon(
                    Icons.task_alt,
                    size: 48,
                  ),
                  content: SizedBox(
                    height: 150,
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          product.title,
                        ),
                        Row(
                          children: [
                            const Text('QTY: '),
                            Text(quantity.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Total Price: '),
                            Text('${quantity * product.price}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, CartView.id);
                        },
                        child: const Text('go to cart')),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('continue'),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
