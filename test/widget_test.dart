import 'package:flutter_test/flutter_test.dart';
import 'package:water_management/app/app.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const WaterManagementApp());
    await tester.pumpAndSettle();

    // Verify the app title or water icon is displayed.
    expect(find.text('Water Management'), findsWidgets);
  });
}
