import 'package:flutter/material.dart';

class DropdownListTile<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final Function(T? value) onChanged;
  final T? labelType;
  final Widget label;

  const DropdownListTile(
      {Key? key,
      required this.items,
      required this.onChanged,
       this.labelType, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(child: label),
          DropdownButton<T>(
              value: labelType??items.first.value,
              items: items,
              onChanged: (value) {
                onChanged(value);
              })
        ],
      ),
    );
  }
}
