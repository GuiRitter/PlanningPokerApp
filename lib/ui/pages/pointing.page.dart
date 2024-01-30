import 'package:flutter/material.dart';
import 'package:planning_poker_any/redux/connection.reducer.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';

class PointingPage extends StatelessWidget {
  static const routeName = "/";

  const PointingPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final fieldPadding = Theme.of(
          context,
        ).textTheme.labelLarge?.fontSize ??
        0.0;

    onBackPressed() => disconnect(
          context: context,
        );

    return Scaffold(
      appBar: AppBarCustomWidget(
        appBarLeading: BackButton(
          onPressed: onBackPressed,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          fieldPadding,
        ),
        child: const Text(
          "Pointing Page",
        ),
      ),
    );
  }

  void disconnect({
    required BuildContext context,
  }) {
    final dispatch = getDispatch(
      context: context,
    );

    dispatch(
      const DisconnectAction(),
    );
  }
}
