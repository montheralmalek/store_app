import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/helper/providers.dart';
import 'package:store_app/helper/routes.dart';
import 'package:store_app/views/home_view/home_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        routes: routes,
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
