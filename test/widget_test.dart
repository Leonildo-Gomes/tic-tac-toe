import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/screens/home/home_screen.dart';

void main() {
  testWidgets('App starts with SplashScreen and navigates to HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the SplashScreen is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the splash screen to finish
    await tester.pumpAndSettle();

    // Verify that we have navigated to the HomeScreen
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);
  });
}