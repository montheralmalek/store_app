import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/widgets/category_card_widget.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({
    super.key,
    required this.categoriesList,
  });
  final List<CategoryModel> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      // color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(vertical: 6),
      //color: const Color(0xffffaa66),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            children: [
              CategoryCardWidget(
                categories: categoriesList[index],
                width: 100,
              ),
              const Gap(10),
            ],
          );
        },
      ),
    );
  }
}
