import 'package:aba/core/navigation/abc_router.dart';
import 'package:aba/core/theme/abc_fun_colors.dart';
import 'package:aba/core/theme/abc_fun_theme.dart';
import 'package:flutter/material.dart';

import 'package:riverpod/riverpod.dart';
late ProviderContainer provider;

abstract class Providers {
static final appRouter = Provider<AbcRouter>((ref) {
  return AbcRouter();
});
}


