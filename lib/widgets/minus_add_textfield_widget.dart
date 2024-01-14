import 'package:flutter/material.dart';

class MinusAddTextFieldWidget extends StatefulWidget {
  const MinusAddTextFieldWidget({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<MinusAddTextFieldWidget> createState() =>
      _MinusAddTextFieldWidgetState();
}

class _MinusAddTextFieldWidgetState extends State<MinusAddTextFieldWidget> {
  //final ProductModel product;
  int value = 0;
  @override
  void initState() {
    widget.controller.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            value = int.parse(widget.controller.text);
            setState(() {
              widget.controller.text = value > 1 ? '${value - 1}' : '$value';
            });
          },
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 50,
          height: 40,
          child: TextFormField(
            textInputAction: TextInputAction.done,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            enabled: false,
            controller: widget.controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: const OutlineInputBorder(),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onBackground))),
          ),
        ),
        IconButton(
          onPressed: () {
            value = int.parse(widget.controller.text);
            setState(() {
              widget.controller.text = '${value + 1}';
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
