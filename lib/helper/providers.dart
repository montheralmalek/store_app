import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubit/cart_cubit.dart';
import '../cubits/favorite_cubits/favorite_cubit.dart';
import '../cubits/get_all_categories_cubit/get_all_categories_cubit.dart';
import '../cubits/get_all_products/get_all_products_cubit.dart';
import '../cubits/get_custom_product_cubit/get_custom_product_cubit.dart';
import '../cubits/home_pages_cubits/home_pages_cubit.dart';
import '../cubits/session_cubits/session_cubit.dart';

List<BlocProvider> providers = [
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
  BlocProvider(
    create: (context) => FavoriteCubit(),
  ),
  BlocProvider(
    create: (context) => HomePagesCubit(),
  ),
  BlocProvider(
    create: (context) => SessionCubit(),
  )
];
