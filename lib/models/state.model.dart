import 'package:flutter/material.dart';

class StateModel {
  final ThemeMode themeMode;

  const StateModel({
    required this.themeMode,
  });

  StateModel copyWith({
    required ThemeMode? themeMode,
  }) =>
      StateModel(
        themeMode: (themeMode != null) ? themeMode : this.themeMode,
      );
}
