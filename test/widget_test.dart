// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habitmate/main.dart';

import 'package:habitmate/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets('Welcome text is visible', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());
    expect(
      find.text(getIt.get<AppLocalizations>().welcome_to),
      findsOneWidget,
    );

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
