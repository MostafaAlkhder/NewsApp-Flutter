import 'package:flutter/material.dart';

void navigateTo(BuildContext ctx, Widget toWidget) =>
    Navigator.push(ctx, MaterialPageRoute(builder: (context) => toWidget));
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (route) {
        return false;
      },
    );
