import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';
import 'package:planning_poker_any/redux/theme.reducer.dart';

StateModel reducer(
  StateModel stateModel,
  dynamic action,
) =>
    {
      ActionType.setTheme: () => setTheme(
            stateModel: stateModel,
            action: action,
          ),
    }[(action as ActionModel).type]!();
