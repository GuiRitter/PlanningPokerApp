import 'package:flutter/material.dart';
import 'package:planning_poker_any/models/query_string.model.dart';
import 'package:planning_poker_any/ui/widgets/body.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static const routeName = "/";

  @override
  Widget build(
    BuildContext context,
  ) {
    final queryString = ModalRoute.of(
      context,
    )!
        .settings
        .arguments as QueryStringModel?;

    return BodyWidget(
      body: Text(
        "Username field\nConnect button\n${queryString?.token}",
      ),
    );
  }
}
