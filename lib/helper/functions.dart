import 'package:flutter/material.dart';

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

//** ------------------- Int With String To String------------- */
String intWithString(int num, String word) {
  String result = '';
  result += '$num $word';
  if (num > 1) {
    result += 's';
  }
  return result;
}

String? emptyValidate(String? value) {
  if (value!.isEmpty) {
    return 'This field is required';
  }
  return null;
}
