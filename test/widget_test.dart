// basic Flutter widget test.

import 'dart:ui' as ui;
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App shows author name and portfolio link', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const MyApp());

    // Verify that the main content is visible
    expect(find.text('Nima Jafari'), findsOneWidget);
    expect(find.textContaining('nimajafaricomp.github.io'), findsOneWidget);
  });
  testWidgets('No overflow on narrow viewport', (WidgetTester tester) async {
    // Simulate a narrow screen width
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    binding.window.physicalSizeTestValue = const ui.Size(360, 800);
    binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());
    // Advance a short time to let initial frames render (avoid pumpAndSettle timeouts caused by continuous animations)
    await tester.pump(const Duration(milliseconds: 500));

    // Basic assertions
    expect(find.text('Nima Jafari'), findsOneWidget);

    // Clean up test window override
    binding.window.clearPhysicalSizeTestValue();
    binding.window.clearDevicePixelRatioTestValue();
  });}
