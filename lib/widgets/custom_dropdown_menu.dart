import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  late String dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownMenu<String>(
          leadingIcon: const Icon(Icons.category),
          label: Text('-- ${widget.label ?? " "} --'),
          onSelected: widget.onPressed,
          dropdownMenuEntries:
              widget.list.map<DropdownMenuEntry<String>>((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList(),
        ),
        const Gap(10),
        DropdownButtonFormField<String>(
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 28,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.category),
            border: const OutlineInputBorder(),
            label: Text(widget.label ?? ''),
          ),
          onChanged: (String? value) {
            setState(() {
              dropdownValue = value!;
            });
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: RadioMenuButton(
                value: value,
                groupValue: dropdownValue,
                onChanged: null,
                child: Text(value),
              ), //Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
