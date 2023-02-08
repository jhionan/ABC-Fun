import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
            MaterialButton(
              onPressed: () => _navigateToGame(context),
              child: Text('Começar'),
            ),
            SizedBox(height: 32,),
            MaterialButton(
              onPressed: () => _navigateToGame(context),
              child: Text('Sobre'),
            ),
          ],
        ),
      ),
    );
  }

  _navigateToGame(BuildContext context) {}
}
