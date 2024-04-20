import 'package:flutter/material.dart';

final colorSheme = ColorScheme(
  background: const Color(0xFF0C1D4D),
  // background: Colors.red,
  surface: const Color(0xFFFFFFFF).withOpacity(0.08),
  brightness: Brightness.light,
  primary: const Color(0xFFFFFFFF),
  onPrimary: const Color(0xFF000000),
  primaryContainer: const Color(0xFFFFFFFF),
  onPrimaryContainer: const Color(0xFF000000),
  secondary: const Color(0xFFFFFFFF).withOpacity(0.16),
  onSecondary: const Color(0xFFFFFFFF),
  secondaryContainer: const Color(0xFFFFFFFF).withOpacity(0.16),
  onSecondaryContainer: const Color(0xFFFFFFFF),
  tertiary: const Color(0xFFFFFFFF).withOpacity(0.32),
  onTertiary: const Color(0xFF000000),
  tertiaryContainer: const Color(0xFFFFFFFF).withOpacity(0.32),
  onTertiaryContainer: const Color(0xFF000000),
  error: const Color(0xFFCC3C21),
  onError: const Color(0xFFFFFFFF),
  errorContainer: const Color(0xFFCC3C21).withOpacity(0.32),
  onErrorContainer: const Color(0xFFCC3C21),
  onBackground: const Color(0xFFFFFFFF),
  onSurface: const Color(0xFFFFFFFF),
  surfaceVariant: const Color(0xFF000000).withOpacity(0.01),
  onSurfaceVariant: const Color(0xFFFFFFFF).withOpacity(0.12),
  outline: const Color(0xFFFFFFFF).withOpacity(0.16),
  outlineVariant: const Color(0xFFFFFFFF).withOpacity(0.48),
);

const customGradient = LinearGradient(
  colors: [Color(0xFF0C1D4D), Color(0xFF214ECC)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
