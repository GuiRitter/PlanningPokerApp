import 'package:flutter/material.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';

class BodyWidget extends StatelessWidget {
  final Widget body;

  const BodyWidget({
    super.key,
    required this.body,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = Theme.of(
      context,
    );

    final fieldPadding = theme.textTheme.labelLarge?.fontSize ?? 0.0;

    return Scaffold(
      appBar: const AppBarCustomWidget(),
      body: Padding(
        padding: EdgeInsets.all(
          fieldPadding,
        ),
        child: Center(
          child: body,
        ),
      ),
    );
  }
}
