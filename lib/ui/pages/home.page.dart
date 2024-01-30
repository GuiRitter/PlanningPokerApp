import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/redux/pointing.reducer.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(
      context,
    )!;

    final dispatch = getDispatch(
      context: context,
    );

    final fieldPadding = Theme.of(
          context,
        ).textTheme.labelLarge?.fontSize ??
        0.0;

    onConnectPressed() => dispatch(
          const ConnectAction(),
        );

    return Scaffold(
      appBar: const AppBarCustomWidget(),
      body: Padding(
        padding: EdgeInsets.all(
          fieldPadding,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IntrinsicWidth(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: l10n.userName,
                    hintText: l10n.userName,
                  ),
                ),
              ),
              SizedBox.square(
                dimension: fieldPadding,
              ),
              ElevatedButton(
                onPressed: onConnectPressed,
                child: Text(
                  l10n.connect,
                ),
              ),
              SizedBox.square(
                dimension: fieldPadding,
              ),
              IntrinsicWidth(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: l10n.code,
                    hintText: l10n.code,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
