import 'package:flutter/material.dart';
import 'package:peerdart/peerdart.dart';
import 'package:redux/redux.dart';

class StateModel {
  final ThemeMode themeMode;
  final String? userName;
  final String? code;
  final Peer? peerManager;

  const StateModel({
    required this.themeMode,
    required this.userName,
    required this.code,
    required this.peerManager,
  });

  StateModel withPeerManager({
    required Peer? peerManager,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        peerManager: peerManager,
      );

  StateModel withThemeMode({
    required ThemeMode themeMode,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        peerManager: peerManager,
      );

  StateModel withUsername({
    required String? userName,
  }) =>
      StateModel(
        themeMode: themeMode,
        userName: userName,
        code: code,
        peerManager: peerManager,
      );

  static bool selectIsConnected(
    Store<StateModel> store,
  ) =>
      store.state.peerManager != null;

  static String selectUserNameNotNull(
    Store<StateModel> store,
  ) =>
      store.state.userName ?? "";
}
