import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/views/category_product_view.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categories,
    required this.width,
    this.circularRadius = 100,
  });
  final CategoryModel categories;
  final double width;
  final double circularRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryProductsView.id,
            arguments: categories);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        width: width,
        //margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categories.img),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(circularRadius),
          border: Border.all(color: const Color(0xffffffff), width: 0),
        ),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          color: const Color.fromARGB(105, 77, 77, 77),
          child: Text(
            categories.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
