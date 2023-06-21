import 'package:aba/core/images.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/menu/bloc/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension MenuNamesExt on MenuEvent {
  String name(BuildContext context) {
    switch (this) {
      case MenuEvent.dashboard:
        return AppLocalizations.of(context).menuDashboard;
      case MenuEvent.settings:
        return AppLocalizations.of(context).menuSettings;
      case MenuEvent.challenges:
        return AppLocalizations.of(context).menuChallenges;
      case MenuEvent.about:
        return AppLocalizations.of(context).menuAbout;
      case MenuEvent.exit:
        return AppLocalizations.of(context).menuExit;
      case MenuEvent.accountSync:
        return AppLocalizations.of(context).menuAccountSync;
    }
  }
}

class Menu extends StatefulWidget {
  const Menu({super.key, required this.child});
  final Widget child;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(builder: (context, type) {
      return Scaffold(
        appBar: type.isTablet
            ? AppBar(
                title: BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    return Text('Menu $state');
                  },
                ),
              )
            : null,
        drawer: MenuDrawer(),
        body: Row(
          children: [
            if (type.isDesktop) MenuDrawer(),
            Expanded(child: widget.child),
          ],
        ),
      );
    });
  }

  _navigateToGame(BuildContext context, MenuEvent e) {}
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Theme(
        data: Theme.of(context).copyWith(
            listTileTheme: Theme.of(context)
                .listTileTheme
                .copyWith(titleTextStyle: const TextStyle(fontSize: 20, color: AbcColors.text)),
            dividerTheme: const DividerThemeData(color: Colors.transparent)),
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset(Images.logo),
            ),
            ListTile(
              title: Text(MenuEvent.dashboard.name(context)),
              // titleTextStyle: TextStyle(fontSize: 20, color: AbcColors.text),
              leading: Image.asset(
                Images.dashboardIcon,
                width: 40,
                height: 40,
              ),
              onTap: () {
                // context.router.push(DashboardRoute());
              },
            ),
            ListTile(
              title: Text(MenuEvent.challenges.name(context)),
              leading: Image.asset(
                Images.performanceIcon,
                width: 40,
                height: 40,
              ),
              onTap: () {
                // context.router.push(ChallengesRoute());
              },
            ),
            ListTile(
              title: Text(MenuEvent.settings.name(context)),
              leading: Image.asset(
                Images.settingsIcon,
                width: 40,
                height: 40,
              ),
              onTap: () {
                //  context.router.push(SettingsRoute());
              },
            ),
            ListTile(
              title: Text(MenuEvent.about.name(context)),
              leading: Image.asset(
                Images.supportIcon,
                width: 40,
                height: 40,
              ),
              onTap: () {
                //  context.router.push(AboutRoute());
              },
            ),
            ListTile(
              title: Text(MenuEvent.accountSync.name(context)),
              leading: Image.asset(
                Images.accountSync,
                width: 40,
                height: 40,
              ),
              onTap: () {
                // context.router.push(ExitRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
