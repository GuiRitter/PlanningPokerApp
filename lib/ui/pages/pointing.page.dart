import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/common/app_bar_popup_menu.enum.dart';
import 'package:planning_poker_any/main.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/action.model.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/redux/selector.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';
import 'package:planning_poker_any/utils/dialogs.dart';
import 'package:planning_poker_any/utils/logger.dart';
import 'package:qr_flutter/qr_flutter.dart';

final GlobalKey listTileKey = GlobalKey();

double? qRWidth;

final _log = logger("PointingPage");

Future<double> getQRWidth({
  required int delay,
}) async {
  _log("getQRWidth").raw("delay", delay).print();

  if (qRWidth != null) {
    return qRWidth!;
  }

  await Future.delayed(
    Duration(
      microseconds: delay,
    ),
  );

  final BuildContext? context = listTileKey.currentContext;

  if ((context != null) && (context.mounted)) {
    final renderBox = context.findRenderObject() as RenderBox;

    qRWidth = renderBox.size.width;

    return qRWidth!;
  } else {
    return await getQRWidth(
      delay: delay + 1,
    );
  }
}

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

    final l10n = AppLocalizations.of(
      context,
    )!;

    return Scaffold(
      appBar: AppBarCustomWidget(
        appBarLeading: BackButton(
          onPressed: onBackPressed,
        ),
        popupMenuItemList: [
          buildPopupMenuItem(
            label: l10n.share,
            icon: Icons.share,
            menuEnum: AppBarPopupMenuEnum.share,
          ),
        ],
        onHomePopupMenuItemPressedMap: {
          AppBarPopupMenuEnum.share: showShareLinkDialog,
        },
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

  showShareLinkDialog(
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(
      context,
    )!;

    builder(
      context,
      shareLink,
    ) {
      onCopyPressed() {
        showSnackBar(
          message: l10n.shareCopied,
        );

        Clipboard.setData(
          ClipboardData(
            text: shareLink,
          ),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            key: listTileKey,
            title: SelectableText(
              shareLink,
              maxLines: 1,
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.copy,
              ),
              onPressed: onCopyPressed,
            ),
          ),
          FutureBuilder(
            future: getQRWidth(
              delay: 0,
            ),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  color: Colors.white,
                  width: qRWidth,
                  height: qRWidth,
                  child: QrImageView(
                    data: shareLink,
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      );
    }

    return showDialog(
      context: context,
      builder: (
        context,
      ) {
        onCancelPressed() => onDialogCancelPressed(
              context: context,
            );

        return AlertDialog(
          title: Text(
            l10n.share,
          ),
          content: StoreConnector<StateModel, String>(
            converter: shareLinkSelector,
            builder: builder,
          ),
          actions: [
            TextButton(
              onPressed: onCancelPressed,
              child: Text(
                l10n.dismiss,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        );
      },
    );
  }
}
