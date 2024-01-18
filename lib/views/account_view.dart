import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/not_logedin_widget.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    if (isLogedIn) {
      return const Center(
        child: Text(
          'Account page',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
      );
    } else {
      return const Center(
        child: NotLogedInWidget(),
      );
    }
  }
}
