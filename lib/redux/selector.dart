import 'package:planning_poker_any/common/settings.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:redux/redux.dart';

String shareLinkSelector(
  Store<StateModel> store,
) {
  final uri = Uri.https(domain, appName, {
    "user_name": store.state.userName,
    "code": store.state.peerManager?.id ?? "",
  });

  return uri.toString();
}
