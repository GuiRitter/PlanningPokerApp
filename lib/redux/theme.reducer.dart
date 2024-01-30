import 'package:flutter/material.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';

StateModel setTheme({
  required StateModel stateModel,
  required SetThemeAction action,
}) =>
    stateModel.withThemeMode(
      themeMode: action.themeMode,
    );

class SetThemeAction extends ActionModel {
  final ThemeMode themeMode;

  const SetThemeAction({
    super.type = ActionType.setTheme,
    required this.themeMode,
  });
}
