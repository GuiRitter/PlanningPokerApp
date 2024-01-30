import 'package:planning_poker_any/models/state.model.dart';
import 'package:redux/redux.dart';

class ConnectionModel {
  final String? userName;
  final String? code;
  final bool isConnected;

  const ConnectionModel({
    required this.userName,
    required this.code,
    required this.isConnected,
  });

  @override
  int get hashCode => Object.hash(
        userName,
        code,
        isConnected,
      );

  @override
  bool operator ==(Object other) =>
      (other is ConnectionModel) &&
      (other.runtimeType == runtimeType) &&
      (other.userName == userName) &&
      (other.code == code) &&
      (other.isConnected == isConnected);

  static ConnectionModel selector(
    Store<StateModel> store,
  ) =>
      ConnectionModel(
        userName: store.state.userName,
        code: store.state.code,
        isConnected: store.state.isConnected,
      );
}
