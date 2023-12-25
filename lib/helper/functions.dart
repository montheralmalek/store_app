import 'package:flutter/material.dart';

Column snapshotError(BuildContext context, String error, String routName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('$error . press Reload button'),
      ElevatedButton(
        onPressed: () => Navigator.pushReplacementNamed(context, routName),
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

void showMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      showCloseIcon: true,
      content: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          message,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    ),
  );
}

String? emptyValidate(String? value) {
  if (value!.isEmpty) {
    return 'This field is required';
  }
  return null;
}
