import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/update_product_view.dart';

class ItemCrad extends StatelessWidget {
  const ItemCrad({
    super.key,
    required this.product,
  });
  final ProductModel product;
  final double radius = 8;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, UpdateProductView.id,
          arguments: product),
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(width: 0.5, color: Colors.grey)),
          child: Column(
            children: [
              //---------- Start item image ------------
              Expanded(
                flex: 2,
                child: Container(
                  // padding:const EdgeInsets.all(5),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image(
                        image: NetworkImage(product.img),
                        //fit: BoxFit.,
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(
                              Icons.favorite_border,
                              // size: 22,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 5,
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Row(
                            children: [
                              Text('4.5'),
                              Gap(5),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.shade100,
                            ),
                            child: const Icon(
                              Icons.add_shopping_cart_outlined,
                              // size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //---------- End item image ------------------------
              //--------------------------------------------------
              const Gap(5),
              //---------- Start item body -----------------------
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(radius),
                      bottomRight: Radius.circular(radius),
                      // topLeft: Radius.circular(radius),
                      // topRight: Radius.circular(radius),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: const TextStyle(
                            color: Color(0xff666666), fontSize: 14),
                      ),
                      const Gap(8),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$ ${product.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                          const Gap(5),
                          Text(
                            '\$ ${product.price}',
                            style: const TextStyle(
                              fontSize: 14,
                              //color: Colors.greenAccent.shade700,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //---------- End item body ------------
            ],
          ),
        );
      }),
    );
  }
}
