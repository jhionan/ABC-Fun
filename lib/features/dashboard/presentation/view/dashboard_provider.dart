import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:abc_fun/features/dashboard/presentation/view/dashboard_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class DashboardProvider extends StatelessWidget {
  const DashboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
        gameSessionRepository: provider.read(Providers.gameSessionRepository),
      ),
      child:const DashboardPage(),
    );
  }
}
