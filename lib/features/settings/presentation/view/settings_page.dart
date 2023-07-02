import 'package:abc_fun/core/domain/view/widgets/abc_scaffold.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, type, constraints) {
        return const Column(
          children: [
            Text('Settings Page'),
          ],
        );
      },
    );
  }
}
