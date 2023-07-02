import 'package:abc_fun/features/menu/bloc/menu_bloc.dart';
import 'package:abc_fun/features/menu/view/menu_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MenuProvider extends StatelessWidget {
  const MenuProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(),
      child: const MenuPage(
        child: AutoRouter(),
      ),
    );
  }
}
