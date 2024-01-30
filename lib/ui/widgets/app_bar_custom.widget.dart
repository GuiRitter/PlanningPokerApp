import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planning_poker_any/common/app_bar_popup_menu.enum.dart';
import 'package:planning_poker_any/common/settings.dart';
import 'package:planning_poker_any/ui/widgets/theme_option.widget.dart';
import 'package:planning_poker_any/utils/dialogs.dart';
import 'package:planning_poker_any/utils/logger.dart';

double? appBarElevation;

final GlobalKey appBarKey = GlobalKey();

final _log = logger("appBarCustom");

Future<double> getAppBarElevation({
  required int delay,
}) async {
  _log("getAppBarElevation").raw("delay", delay).print();

  if (appBarElevation != null) {
    return appBarElevation!;
  }

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = appBarKey.currentContext;

  if (context != null) {
    final statefulElement = context as StatefulElement;

    SingleChildRenderObjectElement? singleChildRenderObjectElement;

    statefulElement.visitChildElements(
      (
        element,
      ) {
        singleChildRenderObjectElement =
            element as SingleChildRenderObjectElement;
      },
    );

    final semantics = singleChildRenderObjectElement!.widget as Semantics;

    final annotatedRegion = semantics.child as AnnotatedRegion;

    final material = annotatedRegion.child as Material;

    appBarElevation = material.elevation;

    return appBarElevation!;
  } else {
    return await getAppBarElevation(
      delay: delay + 1,
    );
  }
}

String? _getSubtitle() {
  return null;
}

_onHomePopupMenuItemPressed({
  required BuildContext context,
  required AppBarPopupMenuEnum value,
}) {
  _log("onHomePopupMenuItemPressed").enum_("value", value).print();

  final l10n = AppLocalizations.of(
    context,
  )!;

  switch (value) {
    case AppBarPopupMenuEnum.theme:
      showDialog(
        context: context,
        builder: (
          context,
        ) {
          final optionList = [
            ThemeOptionWidget(
              themeMode: ThemeMode.dark,
              title: l10n.darkTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeMode.light,
              title: l10n.lightTheme,
            ),
            ThemeOptionWidget(
              themeMode: ThemeMode.system,
              title: l10n.systemTheme,
            ),
          ];

          return AlertDialog(
            title: Text(
              l10n.chooseTheme,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: optionList,
            ),
            actions: [
              TextButton(
                onPressed: () => onDialogCancelPressed(
                  context: context,
                ),
                child: Text(
                  l10n.cancel,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          );
        },
      );
      break;
    default:
      break;
  }
}

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? appBarLeading;

  const AppBarCustomWidget({
    super.key,
    this.appBarLeading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );

  @override
  Widget build(
    BuildContext context,
  ) {
    final context = navigatorState.currentContext!;

    final theme = Theme.of(
      context,
    );

    final l10n = AppLocalizations.of(
      context,
    )!;

    final String? subtitle = _getSubtitle();

    final title = (subtitle == null)
        ? Text(
            l10n.title,
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.title,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              Text(
                subtitle,
              ),
            ],
          );

    return AppBar(
      key: appBarKey,
      title: title,
      leading: appBarLeading,
      actions: [
        PopupMenuButton<AppBarPopupMenuEnum>(
          itemBuilder: (
            context,
          ) =>
              [
            PopupMenuItem<AppBarPopupMenuEnum>(
              value: AppBarPopupMenuEnum.theme,
              child: Text(
                l10n.appTheme,
              ),
            ),
          ],
          onSelected: (
            value,
          ) =>
              _onHomePopupMenuItemPressed(
            context: context,
            value: value,
          ),
        ),
      ],
    );
  }
}
