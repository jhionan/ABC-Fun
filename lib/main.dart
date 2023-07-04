import 'dart:async';

import 'package:abc_fun/core/domain/repositories/user_repository.dart';
import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/navigation/abc_router.dart';
import 'package:abc_fun/core/providers/providers.dart';
import 'package:abc_fun/core/theme/abc_fun_theme.dart';
import 'package:abc_fun/core/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  provider = ProviderContainer();
  setPathUrlStrategy();
  provider.read<UserRepository>(Providers.userRepository).annonymousLogin();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = provider.read<AbcRouter>(Providers.appRouter);
    return AdaptativeScreenBuilder(builder: (context, type, _) {
      return DimensionsProvider(
        dimensions: switch (type) {
          AdaptativeScreenType.handset => Dimensions.handSet(),
          _ => Dimensions.biggerScreens(),
        },
        child: MaterialApp.router(
          routerConfig: appRouter.config(),
          title: 'ABC fun',
          theme: AbcTheme().lightTheme(),
          localizationsDelegates: const [
            AppLocalizations.delegate, // Add this line
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
            Locale('fr', 'FR'),
            Locale('es', 'ES'),
            Locale('de', 'DE'),
          ],
        ),
      );
    });
  }
}
