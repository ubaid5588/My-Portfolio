import 'package:flutter_test/flutter_test.dart';
import 'package:ubaid_portfolio/app.dart';

void main() {
  testWidgets('PortfolioApp loads all interactive buttons properly', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text("Muhammad"), findsWidgets);
    expect(find.text("Ubaid"), findsWidgets);

    // Verify presence of buttons
    expect(find.text("GitHub"), findsWidgets);
    expect(find.text("LinkedIn"), findsWidgets);
    expect(find.text("Email"), findsWidgets);
    expect(find.text("↓ Download CV"), findsOneWidget);

    // Verify tapping on GitHub button does not throw
    final githubButton = find.text("GitHub").first;
    await tester.tap(githubButton);
    await tester.pump();

    // Verify tapping on LinkedIn button does not throw
    final linkedinButton = find.text("LinkedIn").first;
    await tester.tap(linkedinButton);
    await tester.pump();

    // Verify tapping on Email button does not throw
    final emailButton = find.text("Email").first;
    await tester.tap(emailButton);
    await tester.pump();

    // Verify tapping on Download CV button does not throw
    final cvButton = find.text("↓ Download CV");
    await tester.tap(cvButton);
    await tester.pump();
  });
}
