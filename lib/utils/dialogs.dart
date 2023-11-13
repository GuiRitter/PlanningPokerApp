import 'package:flutter/material.dart';
import 'package:planning_poker_any/utils/logger.dart';

final _log = logger("utils/dialogs");

onDialogCancelPressed({
  required BuildContext context,
}) {
  _log("onDialogCancelPressed").print();

  Navigator.pop(
    context,
  );
}
