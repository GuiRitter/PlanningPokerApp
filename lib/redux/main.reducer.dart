import 'package:flutter/material.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';
import 'package:planning_poker_any/redux/pointing.reducer.dart';
import 'package:planning_poker_any/redux/theme.reducer.dart';
import 'package:provider/provider.dart';

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
) =>
    {
      ActionType.connect: () => connect(
            stateModel: stateModel,
            action: action,
          ),
      ActionType.disconnect: () => disconnect(
            stateModel: stateModel,
            action: action,
          ),
      ActionType.setTheme: () => setTheme(
            stateModel: stateModel,
            action: action,
          ),
    }[(action as ActionModel).type]!();
