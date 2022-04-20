import 'package:flutter/material.dart';
import 'package:mini_chat_app_flutter/theme.dart';

import 'colors.dart';
import 'dimensions.dart';

class AppStyles {
  static final addressBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.smallRadius),
    borderSide: const BorderSide(color: AppColors.greyC4),
  );
  static const underLineBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );

  static final focusedTransparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.smallRadius),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  static final energyBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.smallRadius),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static BoxShadow defaultBoxShadow(context) => BoxShadow(
        color: Theme.of(context).colorScheme.shadow,
        spreadRadius: 0,
        blurRadius: 8,
        offset: const Offset(0, -4), // changes position of shadow
      );
}

errorTextStyle(context) => TextStyle(
      fontSize: 10,
      color: Theme.of(context).errorColor,
      fontWeight: FontWeight.w500,
      height: 1.4,
    );
