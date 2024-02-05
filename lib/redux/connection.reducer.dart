import 'package:peerdart/peerdart.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:planning_poker_any/utils/uuid.dart';

final _log = logger("connection.reducer");

StateModel connect({
  required StateModel stateModel,
  required ConnectAction action,
}) {
  final id = generateUuid();

  final Peer peer = Peer(
    id: id,
  );

  _log("connect").raw("id", peer.id).print();

  return stateModel.withPeerManager(
    peerManager: peer,
  );
}

StateModel setDisconnected({
  required StateModel stateModel,
  required DisconnectAction action,
}) =>
    stateModel.withPeerManager(
      peerManager: null,
    );

StateModel setCode({
  required StateModel stateModel,
  required UpdateCodeAction action,
}) =>
    stateModel.withCode(
      code: action.code,
    );

StateModel setUserName({
  required StateModel stateModel,
  required UpdateUserNameAction action,
}) =>
    stateModel.withUserName(
      userName: action.userName,
    );
