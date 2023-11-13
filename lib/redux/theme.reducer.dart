import 'package:flutter/material.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';

class SetThemeAction extends ActionModel {
  final ThemeMode themeMode;

  const SetThemeAction({
    super.type = ActionType.setTheme,
    required this.themeMode,
  });
}

StateModel setTheme({
  required StateModel stateModel,
  required SetThemeAction action,
}) =>
    stateModel.copyWith(
      themeMode: action.themeMode,
    );
