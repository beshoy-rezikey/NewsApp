import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget appMode({
  required String appMode,
  required bool value,
  required void Function(bool value) Themcahngechange,
  required BuildContext context,
}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'App Mode',
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyText1!.fontSize),
      ),
      Transform.scale(
        scale: .7,
        child: CupertinoSwitch(
          thumbColor: Theme.of(context).focusColor,
          activeColor: Theme.of(context).scaffoldBackgroundColor,
          value: value,
          onChanged: (bool newvalue) {
            Themcahngechange(newvalue);
          },
        ),
      )
    ],
  );
}
