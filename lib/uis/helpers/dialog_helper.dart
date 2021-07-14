import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jvtd_shop_client/commons/constants/string.dart';

class DialogHelper {
  static showLoginDialog(context) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(KString.needLogin),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    KString.actionCancel,
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(KString.actionConfirm),
                ),
              ],
            ));
  }
}


