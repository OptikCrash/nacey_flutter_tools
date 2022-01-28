import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

wdfwShowAlert(
  BuildContext context,
  bool isIOS, {
  Widget title = const Text(''),
  Widget content = const Text(''),
  Map<String, VoidCallback>? confirmTextAndAction,
  Map<String, VoidCallback>? neutralTextAndAction,
  Map<String, VoidCallback>? destructiveTextAndAction,
}) async =>
    isIOS
        ? await showCupertinoDialog<void>(
            context: context,
            builder: (context) =>
                CupertinoAlertDialog(title: title, content: content, actions: [
                  destructiveTextAndAction != null
                      ? CupertinoDialogAction(
                          child: Text(destructiveTextAndAction.keys.first,
                              style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  inherit: false)),
                          onPressed: destructiveTextAndAction.values.first)
                      : Container(),
                  neutralTextAndAction != null
                      ? CupertinoDialogAction(
                          child: Text(neutralTextAndAction.keys.first),
                          onPressed: neutralTextAndAction.values.first)
                      : Container(),
                  confirmTextAndAction != null
                      ? CupertinoDialogAction(
                          child: Text(confirmTextAndAction.keys.first,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  inherit: false)),
                          onPressed: confirmTextAndAction.values.first)
                      : Container(),
                ]))
        : await showDialog<void>(
            context: context,
            builder: (context) => AlertDialog(
                  title: title,
                  content: content,
                  actionsAlignment: MainAxisAlignment.end,
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        neutralTextAndAction != null
                            ? TextButton(
                                child: Text(neutralTextAndAction.keys.first),
                                onPressed: neutralTextAndAction.values.first)
                            : Container(),
                        if (neutralTextAndAction != null &&
                            destructiveTextAndAction != null &&
                            confirmTextAndAction != null)
                          Expanded(child: Container()),
                        destructiveTextAndAction != null
                            ? TextButton(
                                child: Text(destructiveTextAndAction.keys.first,
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        inherit: false)),
                                onPressed:
                                    destructiveTextAndAction.values.first)
                            : Container(),
                        confirmTextAndAction != null
                            ? TextButton(
                                child: Text(confirmTextAndAction.keys.first,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        inherit: false)),
                                onPressed: confirmTextAndAction.values.first)
                            : Container()
                      ],
                    ),
                  ],
                ));
