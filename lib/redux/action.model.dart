import 'package:planning_poker_any/redux/action.type.dart';

class ActionModel {
  final ActionType type;

  const ActionModel({
    required this.type,
  });
}

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

class UpdateCodeAction extends ActionModel {
  final String? code;

  const UpdateCodeAction({
    super.type = ActionType.updateCode,
    required this.code,
  });
}

class UpdateUserNameAction extends ActionModel {
  final String? userName;

  const UpdateUserNameAction({
    super.type = ActionType.updateUserName,
    required this.userName,
  });
}
