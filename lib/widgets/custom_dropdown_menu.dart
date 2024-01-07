import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  const CustomDropdownMenu(
      {super.key, required this.list, this.label, this.onPressed});
  final List<String> list;
  final String? label;
  final void Function(String?)? onPressed;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DropdownMenu<String>(
        width: constraints.maxWidth,
        leadingIcon: const Icon(Icons.category),
        label: Text('-- ${label ?? " "} --'),
        onSelected: onPressed,
        dropdownMenuEntries:
            list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      );
    });
  }
}


// DropdownButtonFormField<String>(
        //   value: dropdownValue,
        //   icon: const Icon(
        //     Icons.arrow_drop_down,
        //   ),
        //   iconSize: 28,
        //   decoration: InputDecoration(
        //     prefixIcon: const Icon(Icons.category),
        //     border: const OutlineInputBorder(),
        //     label: Text(widget.label ?? ''),
        //   ),
        //   onChanged: (String? value) {
        //     setState(() {
        //       dropdownValue = value!;
        //     });
        //   },
        //   items: widget.list.map<DropdownMenuItem<String>>((String value) {
        //     return DropdownMenuItem<String>(
        //       value: value,
        //       child: RadioMenuButton(
        //         value: value,
        //         groupValue: dropdownValue,
        //         onChanged: null,
        //         child: Text(value),
        //       ), //Text(value),
        //     );
        //   }).toList(),
        // )