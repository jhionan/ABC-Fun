import 'package:aba/core/images.dart';
import 'package:aba/core/navigation/abc_router.gr.dart';
import 'package:aba/core/theme/abc_colors.dart';
import 'package:aba/core/utils/widgets/adaptative_screen_builder.dart';
import 'package:aba/features/menu/bloc/menu_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.child});
  final Widget child;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(builder: (context, type) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AbcColors.primary),
          backgroundColor: type.isHandset ? Colors.transparent : null,
        ),
        drawer: MenuDrawer(
          onMenuSelected: _navigate,
        ),
        body: Row(
          children: [
            if (type.isDesktop)
              MenuDrawer(
                onMenuSelected: _navigate,
              ),
            Expanded(child: widget.child),
          ],
        ),
      );
    });
  }

  void _navigate(BuildContext context, MenuSelectedPage event) {
    switch (event) {
      case MenuSelectedPage.dashboard:
        context.router.pop();
        context.router.replace(const DashboardRoute());
      case MenuSelectedPage.settings:
      case MenuSelectedPage.challenges:
        context.router.pop();
        context.router.replace(const ChallengeProviderRoute());
      case MenuSelectedPage.about:
      case MenuSelectedPage.accountSync:
    }
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key, required this.onMenuSelected});

  final void Function(BuildContext context, MenuSelectedPage event) onMenuSelected;

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
                onMenuSelected(context, MenuSelectedPage.dashboard);
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
                onMenuSelected(context, MenuSelectedPage.challenges);
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
                onMenuSelected(context, MenuSelectedPage.settings);
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
                onMenuSelected(context, MenuSelectedPage.accountSync);
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuSelectedPage { dashboard, settings, challenges, about, accountSync }
