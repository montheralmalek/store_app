import 'package:flutter/material.dart';

import '../views/add_product.dart';
import '../views/cart_view.dart';
import '../views/category_product_view.dart';
import '../views/home_view/home_view.dart';
import '../views/login_view.dart';
import '../views/product_view.dart';
import '../views/signup_view.dart';
import '../views/update_product_view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  HomeView.id: (context) => const HomeView(),
  UpdateProductView.id: (context) => const UpdateProductView(),
  CategoryProductsView.id: (context) => const CategoryProductsView(),
  AddProductView.id: (context) => const AddProductView(),
  ProductView.id: (context) => const ProductView(),
  CartView.id: (context) => const CartView(),
  LoginView.id: (context) => const LoginView(),
  SignUpView.id: (context) => const SignUpView(),
};
