import 'package:flutter/material.dart';
import 'package:nit/widgets/constant_widget.dart';

Future<void> CustomDialog (context){
  return showGeneralDialog(
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    context: context,
    pageBuilder: (_, __, ___) {
      return const DialogBox();
    },
    // transitionBuilder: (_, anim, __, child) {R
    //   return SlideTransition(
    //     position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
    //     child: child,
    //   );
    // },
  );

}