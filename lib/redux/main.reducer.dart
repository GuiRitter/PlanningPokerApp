import 'package:flutter/material.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';
import 'package:planning_poker_any/redux/connection.reducer.dart';
import 'package:planning_poker_any/redux/theme.reducer.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:provider/provider.dart';

final _log = logger("main.reducer");

dynamic Function(
  dynamic,
) getDispatch({
  required BuildContext context,
}) =>
    Provider.of<
        dynamic Function(
          dynamic,
        )>(
      context,
      listen: false,
    );

StateModel reducer(
  StateModel stateModel,
  dynamic action,
) {
  _log("reducer").raw("action", (action as ActionModel).type.name).print();

  return {
    ActionType.connect: () => connect(
          stateModel: stateModel,
          action: action as ConnectAction,
        ),
    ActionType.disconnect: () => setDisconnected(
          stateModel: stateModel,
          action: action as DisconnectAction,
        ),
    ActionType.setTheme: () => setTheme(
          stateModel: stateModel,
          action: action as SetThemeAction,
        ),
    ActionType.updateUserName: () => setUserName(
          stateModel: stateModel,
          action: action as UpdateUserNameAction,
        ),
  }[action.type]!();
}
