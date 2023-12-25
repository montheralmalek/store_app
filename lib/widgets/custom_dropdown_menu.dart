import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  const CustomDropdownMenu(
      {super.key, required this.list, this.label, this.onPressed});
  final List<String> list;
  final String? label;
  final void Function(String?)? onPressed;
  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      //initialSelection: '',
      label: Text('-- ${widget.label ?? " "} --'),
      onSelected: widget.onPressed,
      dropdownMenuEntries:
          widget.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
