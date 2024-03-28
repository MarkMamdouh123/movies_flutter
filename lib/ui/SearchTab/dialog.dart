import 'package:flutter/material.dart';

class Dialoge {
  static void hideDialog(BuildContext context, String msg,
      {VoidCallback? postAction}) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Text(
              msg,
              style: TextStyle(color: Colors.black),
            )),
            actions: [
              TextButton(
                child: const Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  postAction?.call();
                },
              ),
            ],
          );
        });
  }

  static void lodingDialog(BuildContext context, String msg) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Row(
              children: [
                const CircularProgressIndicator(),
                const SizedBox(width: 4),
                Text(
                  msg,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            )),
          );
        });
  }

  static void showmsg(BuildContext context, String msg,
      {String pos = 'ok', VoidCallback? postAction, String? txt}) {
    showDialog(
      context: context,
      builder: (BuildContext buildcontext) {
        return AlertDialog(
          content: SingleChildScrollView(
              child: Text(
            msg,
            style: const TextStyle(color: Colors.black),
          )),
          actions: [
            TextButton(
              child: Text(
                pos,
                style: const TextStyle(color: Colors.black),
              ),
              onPressed: () {
                postAction?.call();
              },
            ),
            if (txt != null)
              TextButton(
                child: Text(
                  txt,
                  style: const TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
          ],
        );
      },
    );
  }
}
