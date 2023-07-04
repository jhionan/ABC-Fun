import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:abc_fun/features/settings/presentation/view/settings_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(settingsRepository: provider.read(Providers.settingsRepository)),
      child: const SettingsPage(),
    );
  }
}
