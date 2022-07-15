import 'package:flutter/material.dart';

abstract class Dialogs {
  static alert(
    BuildContext context, {
    String? title,
    String? description,
    String onText = 'OK',
    bool dismissible = true,
  }) {
    return showDialog(
        context: context,
        builder: (_) => WillPopScope(
              onWillPop: () async => dismissible,
              child: AlertDialog(
                title: title != null ? Text(title) : null,
                content: description != null ? Text(description) : null,
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(onText),
                  )
                ],
              ),
            ));
  }
}

abstract class ProgressDialog {
  static Future<void> show(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) => Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              color: Colors.white30,
              child: const CircularProgressIndicator(),
            ));
  }
}
