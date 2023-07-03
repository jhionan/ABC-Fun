import 'package:flutter/material.dart';

abstract class AbcDropDownObject<T> {
  String get name;
  T get value;
}

class AbcDropDown<T> extends StatelessWidget {
  const AbcDropDown({super.key, required this.items, required this.label, required this.onSelected, this.value});

  final List<AbcDropDownObject> items;
  final String label;
  final void Function (T? value) onSelected;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      hint: Text(label),
      items: items.map((e) => DropdownMenuItem<T>(
                value: e.value,
                child: Text(e.name),
              ))
          .toList(),
      
      onChanged: onSelected,
      value: value,
    );
  }

  
}
