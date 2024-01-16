import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';

class MinusAddTextFieldWidget extends StatefulWidget {
  // void editValu(BuildContext context, int index, String value) {
  //   BlocProvider.of<CartCubit>(context).editQuantity(index, int.parse(value));
  // }

  const MinusAddTextFieldWidget({
    super.key,
    required this.controller,
    this.index,
  });

  final TextEditingController controller;
  final int? index;

  @override
  State<MinusAddTextFieldWidget> createState() =>
      _MinusAddTextFieldWidgetState();
}

class _MinusAddTextFieldWidgetState extends State<MinusAddTextFieldWidget> {
  //final ProductModel product;
  int value = 0;
  @override
  void initState() {
    widget.controller.text.isEmpty
        ? widget.controller.text = '1'
        : widget.controller.text = widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            value = int.parse(widget.controller.text);
            setState(() {
              widget.controller.text = value > 1 ? '${value - 1}' : '$value';
            });
            if (widget.index != null) {
              BlocProvider.of<CartCubit>(context).editQuantity(
                  widget.index!, int.parse(widget.controller.text));
            }
          },
          icon: const Icon(Icons.remove_circle_outline),
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
                        color: Theme.of(context).colorScheme.primary))),
          ),
        ),
        IconButton(
          color: Theme.of(context).colorScheme.primary,
          padding: EdgeInsets.zero,
          onPressed: () {
            value = int.parse(widget.controller.text);
            setState(() {
              widget.controller.text = '${value + 1}';
            });
            if (widget.index != null) {
              BlocProvider.of<CartCubit>(context).editQuantity(
                  widget.index!, int.parse(widget.controller.text));
            }
          },
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}
