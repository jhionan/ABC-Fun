import 'package:abc_fun/core/domain/view/widgets/adaptative_screen_builder.dart';
import 'package:abc_fun/core/images.dart';
import 'package:abc_fun/core/navigation/abc_router.gr.dart';
import 'package:abc_fun/core/theme/abc_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return AdaptativeScreenBuilder(builder: (context, type, _) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AbcColors.primary),
          backgroundColor: Colors.transparent,
          leading: type.isDesktop ? const SizedBox.shrink() : null,
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
            const Expanded(child: AutoRouter()),
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
        context.router.pop();
        context.router.replace(const SettingsRoute());
      case MenuSelectedPage.challenges:
        context.router.pop();
        context.router.replace(const ChallengeProviderRoute());
      case MenuSelectedPage.about:
        context.router.pop();
        context.router.replace(const AboutRoute());
      case MenuSelectedPage.accountSync:
        context.router.pop();
        context.router.replace(const AccountSyncRoute());
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
              title: Text(AppLocalizations.of(context).menuDashboard),
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
              title: Text(AppLocalizations.of(context).menuChallenges),
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
              title: Text(AppLocalizations.of(context).menuSettings),
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
              title: Text(AppLocalizations.of(context).menuAbout),
              leading: Image.asset(
                Images.supportIcon,
                width: 40,
                height: 40,
              ),
              onTap: () {
                onMenuSelected(context, MenuSelectedPage.about);
              },
            ),
            ListTile(
              title: Text(AppLocalizations.of(context).menuAccountSync),
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
