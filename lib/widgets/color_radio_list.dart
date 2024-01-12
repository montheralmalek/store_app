import 'package:flutter/material.dart';

class ColorRadioList extends StatefulWidget {
  const ColorRadioList({super.key, required this.colorsList});
  final List<int> colorsList;

  @override
  State<ColorRadioList> createState() => _ColorRadioListState();
}

class _ColorRadioListState extends State<ColorRadioList> {
  late int _selectedValue;
  @override
  void initState() {
    _selectedValue = widget.colorsList.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widget.colorsList.map((colorValue) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedValue = colorValue;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(5),
              //height: 20,
              width: 30,

              decoration: BoxDecoration(
                  border: _selectedValue == colorValue
                      ? Border.all(width: 1)
                      : null),
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: Color(colorValue),
                    border: Border.all(color: Colors.black45)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
