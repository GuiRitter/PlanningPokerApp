import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';

class ConnectAction extends ActionModel {
  const ConnectAction({
    super.type = ActionType.connect,
  });
}

class DisconnectAction extends ActionModel {
  const DisconnectAction({
    super.type = ActionType.disconnect,
  });
}

StateModel connect({
  required StateModel stateModel,
  required ConnectAction action,
}) =>
    stateModel.withIsConnected(
      isConnected: true,
    );

StateModel disconnect({
  required StateModel stateModel,
  required DisconnectAction action,
}) =>
    stateModel.withIsConnected(
      isConnected: false,
    );
