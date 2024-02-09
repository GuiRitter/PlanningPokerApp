import 'package:dio/dio.dart';
import 'package:peerdart/peerdart.dart';
import "package:planning_poker_any/common/settings.dart" as settings;
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:planning_poker_any/utils/uuid.dart';

final _log = logger("connection.reducer");

final _api = settings.api;

StateModel connect({
  required StateModel stateModel,
  required ConnectAction action,
}) {
  final id = generateUuid();

  final Peer peer = Peer(
    id: id,
  );

  _log("connect").raw("id", peer.id).print();

  if (stateModel.code?.isNotEmpty ?? false) {
    final conn = peer.connect(
      stateModel.code!,
    );

    conn
        .on(
      "open",
    )
        .listen((
      name,
    ) {
      settings.apiLog(
        "${stateModel.userName} open $name",
      );
      _log("connect on").raw("name", name).print();
      conn.send("hi!");
    });

    conn
        .on(
      "data",
    )
        .listen((
      data,
    ) {
      settings.apiLog(
        "${stateModel.userName} data $data",
      );
      _log("connect data").raw("data", data).print();
    });
  }

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
