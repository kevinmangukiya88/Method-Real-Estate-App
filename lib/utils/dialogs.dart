import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DialogType { dialog, bottomSheet }

showFullWidthDialog(
  BuildContext context,
  Widget child,
  isCancelable,
  DialogType type, {
  heightFactor = 0.86,
}) {
  if (type == DialogType.dialog) {
    showDialog(
      barrierDismissible: isCancelable,
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: child,
      ),
    );
  } else {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      isDismissible: isCancelable,
      isScrollControlled: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor,
        child: child,
      ),
    );
  }
}
