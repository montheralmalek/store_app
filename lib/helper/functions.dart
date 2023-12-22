import 'package:flutter/material.dart';
import 'package:store_app/views/home_view.dart';

Column snapshotError(
    AsyncSnapshot<List<dynamic>> snapshot, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('${snapshot.error.toString()}  press Reload button'),
      ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, HomeView.id),
        child: const SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Reload'), Icon(Icons.refresh)],
          ),
        ),
      )
    ],
  );
}
