import 'package:flutter/material.dart';

class LoaderMixin {
  void showLoaderDialog(BuildContext context) {
    showDialog(
      useRootNavigator: false,
      barrierDismissible: false,
      context: context,
      builder: (_) => Material(
        type: MaterialType.transparency,
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
