import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:store_app/views/add_product.dart';
import 'package:store_app/views/category_product_view.dart';
import 'package:store_app/views/home_view/home_view.dart';
import 'package:store_app/views/update_product_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllProductsCubit(),
        ),
        BlocProvider(
          create: (context) => GetAllCategoriesCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          UpdateProductView.id: (context) => const UpdateProductView(),
          CategoryProductsView.id: (context) => const CategoryProductsView(),
          AddProductView.id: (context) => const AddProductView(),
        },
        initialRoute: HomeView.id,
        debugShowCheckedModeBanner: false,
        title: 'Store App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            // backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            centerTitle: true,
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
