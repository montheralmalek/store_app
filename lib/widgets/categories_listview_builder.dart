import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store_app/helper/functions.dart';
import 'package:store_app/services/get_categories_service.dart';
import 'package:store_app/widgets/category_card_widget.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetCategories().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 112,
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 6),
              //color: const Color(0xffffaa66),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      CategoryCardWidget(categories: snapshot.data![index]),
                      const Gap(10),
                    ],
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return snapshotError(snapshot, context);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
