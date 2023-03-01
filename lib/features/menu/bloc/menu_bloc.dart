import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<MenuEvent>(eventHandler);
  }

  FutureOr<void> eventHandler(MenuEvent event, Emitter<MenuState> emit) {
    switch (event) {
      case MenuEvent.start:
        // TODO: Handle this case.
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
        // TODO: Handle this case.
        break;
    }
  }
}
