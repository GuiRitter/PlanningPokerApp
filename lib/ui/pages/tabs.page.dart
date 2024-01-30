import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/models/connection.model.dart';
import 'package:planning_poker_any/ui/pages/home.page.dart';
import 'package:planning_poker_any/ui/pages/pointing.page.dart';
import 'package:redux/redux.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return StoreConnector<StateModel, ConnectionModel>(
      distinct: true,
      converter: selector,
      builder: connectorBuilder,
    );
  }

  Widget connectorBuilder(
    BuildContext context,
    ConnectionModel store,
  ) =>
      store.isConnected ? const PointingPage() : const HomePage();

  ConnectionModel selector(
    Store<StateModel> store,
  ) =>
      ConnectionModel(
        userName: store.state.userName,
        token: store.state.token,
        isConnected: store.state.isConnected,
      );
}
