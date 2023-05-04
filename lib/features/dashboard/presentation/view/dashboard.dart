import 'package:aba/core/navigation/abc_router.dart';
import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/features/dashboard/presentation/widgets/abc_card.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AbcCard(
              onTap: () {
                context.navigateNamedTo('/game');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('test'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
