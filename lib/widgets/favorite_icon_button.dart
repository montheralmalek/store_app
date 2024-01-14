import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
    required this.product,
    this.size,
    this.iconSize,
    this.backgroundColor,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius,
  });

  final ProductModel product;
  final double? size, iconSize;
  final Color? backgroundColor;
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
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          // BlocProvider.of<CartCubit>(context)
          //     .addItem(product: product, quantity: 1);
        },
      ),
    );
  }
}
