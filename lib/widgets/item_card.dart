import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/update_product_view.dart';

class ItemCrad extends StatelessWidget {
  const ItemCrad({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UpdateProductView.id,
          arguments: product),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: constraints.maxHeight / 3 * 2,
              //
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 8,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(8))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                            color: Color(0xff666666), fontSize: 14),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.price}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                size: 28,
                                color: Color(0xffdd0000),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 85,
              child: SizedBox(
                  height: constraints.maxHeight - 90,
                  width: constraints.maxWidth - 20,
                  child: Image(image: NetworkImage(product.img))),
            ),
          ],
        );
      }),
    );
  }
}
