import 'package:flutter/material.dart';

class Loading {
  static bool isLoading = false;

  static void showLoading(BuildContext context) {
    if (!isLoading) {
      isLoading = true;
      showGeneralDialog(
          context: context,
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.black54,
                ),
              ),
            );
          }).then((v) {
        isLoading = false;
      });
    }
  }

  static void hideLoading(BuildContext context) {
    if (isLoading) {
      Navigator.of(context).pop();
    }
  }
}
