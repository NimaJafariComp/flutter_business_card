// basic flutter widget test

import 'dart:ui' as ui;
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App shows author name and portfolio link', (WidgetTester tester) async {
    // build app and draw frame
    await tester.pumpWidget(const MyApp());

    // check for author and link
    expect(find.text('Nima Jafari'), findsOneWidget);
    expect(find.textContaining('nimajafaricomp.github.io'), findsOneWidget);
  });
  testWidgets('No overflow on narrow viewport', (WidgetTester tester) async {
    // set narrow viewport
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.physicalSizeTestValue = const ui.Size(360, 800);
    binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());
    // wait briefly for frames
    await tester.pump(const Duration(milliseconds: 500));

    // ensure author text visible
    expect(find.text('Nima Jafari'), findsOneWidget);

    // clear test window settings
    binding.window.clearPhysicalSizeTestValue();
    binding.window.clearDevicePixelRatioTestValue();
  });}
