
import 'package:aba/core/domain/view/widgets/abc_scaffold.dart';
import 'package:flutter/material.dart';

class AccountSyncPage extends StatelessWidget {
  const AccountSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AbcScaffold(
      adaptativeBuilder: (context, type, constraints) {
        return Column(
          children: [
            const Text('Account Sync Page'),
          ],
        );
      },
    );
  }
}