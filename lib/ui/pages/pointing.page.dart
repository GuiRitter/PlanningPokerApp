import 'package:flutter/material.dart';
import 'package:planning_poker_any/ui/widgets/body.widget.dart';

class PointingPage extends StatelessWidget {
  const PointingPage({
    super.key,
  });

  static const routeName = "/";

  @override
  Widget build(
    BuildContext context,
  ) {
    return BodyWidget(
      appBarLeading: BackButton(
        onPressed: () => onBackPressed(
          context: context,
        ),
      ),
      body: const Text(
        "Pointing Page",
      ),
    );
  }

  void onBackPressed({
    required BuildContext context,
  }) =>
      Navigator.of(context).pop();
}
