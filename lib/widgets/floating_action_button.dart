import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.chat,
          size: 32,
          //color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          chatDialog(context);
        }, // Navigator.pushNamed(context, AddProductView.id),
      ),
    );
  }

  Future<dynamic> chatDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'Have an account please',
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Text(
                  'or',
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Text(
                  'if you dont have an account.',
                ),
              ],
            ),
            //actions: <Widget>[],
          );
        });
  }
}
