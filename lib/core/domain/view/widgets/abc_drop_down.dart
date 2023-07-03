import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:flutter/material.dart';

abstract class AbcDropDownObject<T> {
  String get name;
  T get value;
}

class AbcDropDown<T> extends StatelessWidget {
  const AbcDropDown({super.key, required this.items, required this.label, required this.onSelected, this.value});

  final List<AbcDropDownObject> items;
  final String label;
  final void Function(T? value) onSelected;
  final T? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 8,
        ),
        DropdownButton<T>(
          hint: Text(label),
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e.value,
                    child: Text(e.name),
                  ))
              .toList(),
          onChanged: onSelected,
          value: value,
          iconEnabledColor: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          underline: const SizedBox.shrink(),
          selectedItemBuilder: (context) => items
              .map<Widget>(
                (e) => Container(
                  width: context.dimensions.maxHorizontalWidth * 0.8,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1,
                      )),
                  child: Center(child: Text(e.name)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
