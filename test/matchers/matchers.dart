import 'package:flutter/material.dart';
import 'package:my_app/src/features/formulary_contact/widgets/formulary_input.dart';
import 'package:my_app/src/features/home/widgets/feature_box.dart';

bool featureItemMatcher(Widget widget, String title, IconData icon) {
  if (widget is FeatureBox) {
    return widget.title == title && widget.icon == icon;
  }
  return false;
}

bool inputItemMatcher(Widget widget, String itemlabel) {
  if (widget is FormularyInput && widget.label == itemlabel) {
    return true;
  }
  return false;
}
