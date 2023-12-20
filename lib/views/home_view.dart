import 'package:flutter/material.dart';
import 'package:store_app/app_config/responsive.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_products_service.dart';
import 'package:store_app/widgets/item_card.dart';

class HomeView extends StatelessWidget {
  static String id = 'homeView';

  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Trend')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<ProductModel>>(
          future: GetProducts().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive().getResponsiveValue(
                      context: context,
                      forShortScreen: 2,
                      forTabletScreen: 3,
                      forMediumScreen: 4,
                      forLargeScreen: 6,
                      forMobLandScapeMode: 4),
                  childAspectRatio: 4 / 5,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ItemCrad(product: snapshot.data![index]);
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${snapshot.error.toString()}  press Reload button'),
                    ElevatedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, HomeView.id),
                      child: const SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Reload'), Icon(Icons.refresh)],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
