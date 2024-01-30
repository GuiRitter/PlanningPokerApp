import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/action.type.dart';

StateModel setConnected({
  required StateModel stateModel,
  required ConnectAction action,
}) =>
    stateModel.withIsConnected(
      isConnected: true,
    );

StateModel setDisconnected({
  required StateModel stateModel,
  required DisconnectAction action,
}) =>
    stateModel.withIsConnected(
      isConnected: false,
    );

StateModel setUserName({
  required StateModel stateModel,
  required UpdateUserNameAction action,
}) =>
    stateModel.withUsername(
      userName: action.userName,
    );

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

class UpdateUserNameAction extends ActionModel {
  final String? userName;

  const UpdateUserNameAction({
    super.type = ActionType.updateUserName,
    required this.userName,
  });
}
