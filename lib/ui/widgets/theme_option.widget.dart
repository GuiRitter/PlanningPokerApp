import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/common/settings.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/redux/theme.reducer.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = logger("ThemeOptionWidget");

class ThemeOptionWidget extends StatelessWidget {
  final ThemeMode themeMode;
  final String title;

  const ThemeOptionWidget({
    super.key,
    required this.themeMode,
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
  ) =>
      StoreConnector<StateModel, ThemeMode>(
        converter: (
          store,
        ) =>
            store.state.themeMode,
        builder: (
          context,
          themeModeCurrent,
        ) =>
            ListTile(
          onTap: () => onThemeTapped(
            context: context,
            themeMode: themeMode,
          ),
          title: Text(
            title,
          ),
          trailing: Icon(
            (themeModeCurrent == themeMode)
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
          ),
        ),
      );

  onThemeTapped({
    required BuildContext context,
    required ThemeMode themeMode,
  }) {
    _log("onThemeTapped").enum_("themeMode", themeMode).print();

    final dispatch = getDispatch(
      context: context,
    );

    dispatch(
      SetThemeAction(
        themeMode: themeMode,
      ),
    );

    SharedPreferences.getInstance().then(
      (
        prefs,
      ) {
        prefs.setString(
          themeKey,
          themeMode.name,
        );
      },
    );

    Navigator.pop(
      context,
    );
  }
}
