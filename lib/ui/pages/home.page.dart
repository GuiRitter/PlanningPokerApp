import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planning_poker_any/models/state.model.dart';
import 'package:planning_poker_any/redux/connection.reducer.dart';
import 'package:planning_poker_any/redux/main.reducer.dart';
import 'package:planning_poker_any/ui/widgets/app_bar_custom.widget.dart';
import 'package:planning_poker_any/utils/validation.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  HomePage({
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

    onConnectPressed() => connect(
          dispatch,
        );

    onUserNameChanged(
      String userNameNewValue,
    ) =>
        dispatch(
          UpdateUserNameAction(
            userName: userNameNewValue,
          ),
        );

    userNameValidator(
      String? value,
    ) =>
        getRequiredStringError(
          value: value,
          errorMessage: l10n.userNameInvalid,
        );

    userNameFieldBuilder(
      context,
      userName,
    ) =>
        TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: l10n.userName,
            hintText: l10n.userName,
          ),
          onChanged: onUserNameChanged,
          validator: userNameValidator,
          initialValue: userName,
        );

    return Scaffold(
      appBar: const AppBarCustomWidget(),
      body: Padding(
        padding: EdgeInsets.all(
          fieldPadding,
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntrinsicWidth(
                  child: StoreConnector<StateModel, String>(
                    converter: StateModel.selectUserNameNotNull,
                    builder: userNameFieldBuilder,
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
                StoreConnector<StateModel, String>(
                  distinct: true,
                  converter: (store) => store.state.userName ?? "",
                  builder: (context, vm) => Text(vm),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  connect(
    dynamic Function(
      dynamic,
    ) dispatch,
  ) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    dispatch(const ConnectAction());
  }
}
