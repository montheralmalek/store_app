import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/views/category_product_view.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key,
    required this.categories,
  });
  final CategoryModel categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryProductsView.id,
            arguments: categories);
      },
      child: Container(
        alignment: Alignment.center,
        width: 100, height: 100,
        //margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categories.img),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(100)),
        ),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(105, 77, 77, 77),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: const Color(0xffffffff), width: 0),
          ),
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
