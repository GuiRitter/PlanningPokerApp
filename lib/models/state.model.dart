import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class StateModel {
  final ThemeMode themeMode;
  final String? userName;
  final String? code;
  final bool isConnected;

  const StateModel({
    required this.themeMode,
    required this.userName,
    required this.code,
    required this.isConnected,
  });

  StateModel withIsConnected({
    required bool isConnected,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        isConnected: isConnected,
      );

  StateModel withThemeMode({
    required ThemeMode themeMode,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        isConnected: isConnected,
      );

  StateModel withUsername({
    required String? userName,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        isConnected: isConnected,
      );

  static bool selectIsConnected(
    Store<StateModel> store,
  ) =>
      store.state.isConnected;

  static String selectUserNameNotNull(
    Store<StateModel> store,
  ) =>
      store.state.userName ?? "";
}
