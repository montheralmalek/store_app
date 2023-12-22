import 'package:flutter/material.dart';
import 'package:store_app/models/category_model.dart';
import 'package:store_app/widgets/products_listview_builder.dart';

class CategoryProductsView extends StatefulWidget {
  static String id = 'Category Products View';

  const CategoryProductsView({super.key});

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: ,
            automaticallyImplyLeading: false,
            centerTitle: false,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: AssetImage(category.img),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircularIconButton(
                  icon: Icons.clear,
                  size: 40,
                  onPressed: () => Navigator.pop(context),
                ),
                CircularIconButton(
                  icon: Icons.search,
                  size: 40,
                  onPressed: () {},
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(15),
              child: Container(
                //height: double.infinity,
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .primary, //.withOpacity(0.9),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),

                child: Text(
                  category.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: ProductsListViewBuilder(
              category: category.name,
            ),
          ),
        ],
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.size,
    this.iconSize,
  });
  final double? size, iconSize;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      //margin: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      ),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero,
        color: Colors.white,
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

// class CategoryProductsAppBar extends StatelessWidget {
//   const CategoryProductsAppBar({
//     super.key,
//     required this.category,
//   });

//   final CategoryModel category;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 50),
//       alignment: Alignment.centerRight,
//       //width: double.infinity,
//       height: 120,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(category.img),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // const Gap(10),
//           Container(
//             height: 60,
//             width: 60,
//             //margin: const EdgeInsets.symmetric(horizontal: 15),
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(50),
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
//             ),
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               color: Colors.white,
//               icon: const Icon(
//                 Icons.arrow_back,
//                 size: 32,
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ),
//           Container(
//             height: double.infinity,
//             width: 175,
//             alignment: Alignment.center,
//             padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
//             color: Theme.of(context)
//                 .colorScheme
//                 .primary
//                 .withOpacity(0.8), //const Color(0xddffffff),
//             child: Text(
//               category.name.toUpperCase(),
//               textAlign: TextAlign.center,
//               style: const TextStyle(
//                 fontSize: 22,
//                 color: Colors.white, //Theme.of(context).colorScheme.primary,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
