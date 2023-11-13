import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/common/settings.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/redux/theme.reducer.dart';
import 'package:planning_poker_any/themes/dark.theme.dart';
import 'package:planning_poker_any/themes/light.theme.dart';
import 'package:planning_poker_any/ui/pages/home.page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = logger("main");

void main() {
  final store = Store<StateModel>(
    reducer,
    initialState: const StateModel(
      themeMode: ThemeMode.system,
    ),
  );

  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  final Store<StateModel> store;

  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final dispatch = store.dispatch;

    SharedPreferences.getInstance().then(
      (
        prefs,
      ) {
        final themeName = prefs.getString(themeKey);

        _log("build SharedPreferences.getInstance")
            .raw("theme", themeName)
            .print();

        if (themeName?.isNotEmpty ?? false) {
          final theme = ThemeMode.values.byName(
            themeName!,
          );

          dispatch(
            SetThemeAction(
              themeMode: theme,
            ),
          );
        }
      },
    );

    final theme = Theme.of(
      context,
    );

    final fieldPadding = theme.textTheme.labelLarge?.fontSize ?? 0.0;

    final themeLight = light(
      context: context,
    );

    final themeDark = dark(
      context: context,
    );

    return MultiProvider(
      providers: [
        Provider<
            dynamic Function(
              dynamic,
            )>.value(
          value: dispatch,
        ),
      ],
      child: StoreProvider<StateModel>(
        store: store,
        child: StoreConnector<StateModel, ThemeMode>(
          converter: (
            store,
          ) =>
              store.state.themeMode,
          builder: (
            context,
            themeMode,
          ) =>
              MaterialApp(
            title: 'Planning Poker',
            onGenerateTitle: (
              context,
            ) {
              final l10n = AppLocalizations.of(
                context,
              )!;

              return l10n.title;
            },
            theme: themeLight,
            darkTheme: themeDark,
            themeMode: themeMode,
            home: Scaffold(
              appBar: const AppBarCustomWidget(),
              body: Padding(
                padding: EdgeInsets.all(
                  fieldPadding,
                ),
                child: const HomePage(),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: navigatorState,
          ),
        ),
      ),
    );
  }
}
