import 'package:flutter/material.dart';
import 'package:store_app/widgets/customtextfield.dart';

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
          width: 60,
          height: 45,
          child: CustomTextFormField(
            controller: widget.controller,
            textAlign: TextAlign.center,
            labeltext: '',
            inputType: TextInputType.number,
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
