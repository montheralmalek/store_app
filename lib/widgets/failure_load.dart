import 'package:flutter/material.dart';

class FailureLoad extends StatelessWidget {
  const FailureLoad({super.key, this.error, this.onPressed});
  final String? error;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    //return const  String error, VoidCallback? onPressed
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$error . press Reload button'),
            ElevatedButton(
              onPressed: onPressed,
              child: const SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Reload'), Icon(Icons.refresh)],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
