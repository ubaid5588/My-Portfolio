import 'package:flutter_test/flutter_test.dart';
import 'package:ubaid_portfolio/app.dart';

void main() {
  testWidgets('PortfolioApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text("Muhammad"), findsWidgets);
  });
}
