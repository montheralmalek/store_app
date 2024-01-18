import 'package:flutter/material.dart';
import 'package:store_app/views/login_view.dart';
import 'package:store_app/views/signup_view.dart';

class NotLogedInWidget extends StatelessWidget {
  const NotLogedInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Have an account please',
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, LoginView.id),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'or',
            style: TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, SignUpView.id),
            child: const Text(
              'sign Up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'if you dont have an account.',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
