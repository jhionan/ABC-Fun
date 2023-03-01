import 'package:aba/features/game/presentation/view/game_provider.dart';
import 'package:aba/features/menu/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension MenuNamesExt on MenuEvent {
  String name(BuildContext context) {
    switch (this) {
      case MenuEvent.start:
        return AppLocalizations.of(context)!.menuStart;
      case MenuEvent.settings:
        return AppLocalizations.of(context)!.menuSettings;
      case MenuEvent.score:
        return AppLocalizations.of(context)!.menuScore;
      case MenuEvent.about:
        return AppLocalizations.of(context)!.menuAbout;
      case MenuEvent.exit:
        return AppLocalizations.of(context)!.menuExit;
    }
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...MenuEvent.values.map((e) {
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        onPressed: () => _navigateToGame(context, e),
                        child: Text(e.name(context), style: const TextStyle(fontSize: 32),),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  _navigateToGame(BuildContext context, MenuEvent e) {
    switch (e) {
      case MenuEvent.start:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GameProvider(),
        ));
        break;
      case MenuEvent.settings:
        // TODO: Handle this case.
        break;
      case MenuEvent.score:
        // TODO: Handle this case.
        break;
      case MenuEvent.about:
        // TODO: Handle this case.
        break;
      case MenuEvent.exit:
       
    }
  }
}
