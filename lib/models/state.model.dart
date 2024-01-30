import 'package:flutter/material.dart';

class StateModel {
  final ThemeMode themeMode;
  final String? userName;
  final String? token;
  final bool isConnected;

  const StateModel({
    required this.themeMode,
    required this.userName,
    required this.token,
    required this.isConnected,
  });

  StateModel withThemeMode({
    required ThemeMode themeMode,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        token: token,
        isConnected: isConnected,
      );

  StateModel withIsConnected({
    required bool isConnected,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        token: token,
        isConnected: isConnected,
      );
}
