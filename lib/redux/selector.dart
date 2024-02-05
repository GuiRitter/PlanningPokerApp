import 'package:flutter/foundation.dart';
import 'package:planning_poker_any/common/settings.dart' as settings;
import 'package:planning_poker_any/models/state.model.dart';
import 'package:redux/redux.dart';

String shareLinkSelector(
  Store<StateModel> store,
) {
  final base = Uri.base;

  final domain = base.authority;

  const appName = kDebugMode ? "" : settings.appName;

  final uri = Uri.https(domain, appName, {
    "code": store.state.peerManager?.id ?? "",
  });

  return uri.toString();
}
