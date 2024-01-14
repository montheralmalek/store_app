import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import 'package:store_app/cubits/get_all_products/get_all_products_cubit.dart';
import 'package:store_app/cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import 'package:store_app/views/add_product.dart';
import 'package:store_app/views/category_product_view.dart';
import 'package:store_app/views/home_view/home_view.dart';
import 'package:store_app/views/product_view.dart';
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
        BlocProvider(
          create: (context) => GetCustomProductsCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          HomeView.id: (context) => const HomeView(),
          UpdateProductView.id: (context) => const UpdateProductView(),
          CategoryProductsView.id: (context) => const CategoryProductsView(),
          AddProductView.id: (context) => const AddProductView(),
          ProductView.id: (context) => const ProductView(),
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
          fontFamily: 'Khand',
        ),
        home: const HomeView(),
      ),
    );
  }
}
