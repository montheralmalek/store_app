import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/widgets/not_logedin_widget.dart';

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
          if (isLogedIn) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    content: Center(
                      child: Text('You are loged in'),
                    ),
                    //actions: <Widget>[],
                  );
                });
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AlertDialog(
                    content: NotLogedInWidget(),
                    //actions: <Widget>[],
                  );
                });
          }
        }, // Navigator.pushNamed(context, AddProductView.id),
      ),
    );
  }
}
