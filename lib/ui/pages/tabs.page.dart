import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/ui/pages/home.page.dart';
import 'package:planning_poker_any/ui/pages/pointing.page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<StateModel, bool>(
        distinct: true,
        converter: StateModel.selectIsConnected,
        builder: connectorBuilder,
      );

  Widget connectorBuilder(
    BuildContext context,
    bool isConnected,
  ) =>
      isConnected ? const PointingPage() : HomePage();
}
