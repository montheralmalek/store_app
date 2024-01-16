import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_cubit.dart';
import 'package:store_app/cubits/favorite_cubits/favorite_states_cubit.dart';
import 'package:store_app/models/product_model.dart';

class FavoriteIconButton extends StatefulWidget {
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
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  Icon? icon;
  bool? isFound;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteCubitStates>(
      builder: (context, state) {
        if (state is FavoriteCubitHasDataState &&
            state.isFound(widget.product.title)) {
          icon = const Icon(Icons.favorite, color: Colors.red);
          isFound = true;
        } else {
          icon = const Icon(Icons.favorite_border);
          isFound = false;
        }

        return Container(
          padding: EdgeInsets.zero,
          height: widget.size,
          width: widget.size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            shape: widget.boxShape,
            color: widget.backgroundColor,
          ),
          child: IconButton(
            iconSize: widget.iconSize,
            padding: EdgeInsets.zero,
            icon: icon!,
            onPressed: () {
              if (isFound!) {
                BlocProvider.of<FavoriteCubit>(context)
                    .removeItem(widget.product.id);
              } else {
                BlocProvider.of<FavoriteCubit>(context).addItem(widget.product);
              }
              // BlocProvider.of<CartCubit>(context)
              //     .addItem(product: product, quantity: 1);
            },
          ),
        );
      },
    );
  }
}
