import 'package:aba/core/navigation/abc_router.dart';
import 'package:aba/core/providers/providers.dart';
import 'package:aba/core/theme/abc_fun_theme.dart';
import 'package:aba/core/theme/dimensions.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  provider = ProviderContainer();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());

  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
