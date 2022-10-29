import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/src/features/home/home_page.dart';
import 'package:my_app/src/features/home/widgets/feature_box.dart';

void main() {
  testWidgets("should show one image when the dashboard is loaded",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));
    final Finder image = find.byType(Image);

    expect(image, findsOneWidget);
  });

  testWidgets("should show the first feature when de dashboard is loadaded",
      ((WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomePage(),
    ));

    final Finder features = find.byType(FeatureBox);
    expect(features, findsWidgets);
  }));
}
