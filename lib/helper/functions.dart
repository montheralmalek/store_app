import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/views/cart_view.dart';

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

//**---------------------- Add to cart showDialog ------------- */
Future<dynamic> addToCartDialog(
    BuildContext context, ProductModel product, int quantity) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          iconColor: Colors.green,
          icon: const Icon(
            Icons.task_alt,
            size: 48,
          ),
          content: SizedBox(
            height: 150,
            width: 200,
            child: Column(
              children: [
                Text(
                  product.title,
                ),
                Row(
                  children: [
                    const Text('QTY: '),
                    Text(quantity.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Text('Total Price: '),
                    Text('${quantity * product.price}'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, CartView.id);
                },
                child: const Text('go to cart')),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('continue'),
            ),
          ],
        );
      });
}
