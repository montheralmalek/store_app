import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: const Text('New Trend'),
      actions: const [
        Icon(
          Icons.search,
          size: 26,
        )
      ],
      leading: const Icon(
        Icons.list,
        size: 32,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          height: 25,
          width: double.maxFinite,
          decoration: BoxDecoration(
              color:
                  Theme.of(context).colorScheme.background, //.withOpacity(0.9),
              border: Border.all(
                  color: Theme.of(context).colorScheme.background, width: 0),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
        ),
      ),
    );
  }
}
