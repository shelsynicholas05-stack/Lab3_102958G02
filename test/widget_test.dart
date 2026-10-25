import 'package:flutter_test/flutter_test.dart';
import 'package:my_menu_app/main.dart';

void main() {
  testWidgets('Menu page shows title and first drink', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Cafe Menu'), findsOneWidget);
    expect(find.text('Cappuccino'), findsOneWidget);
  });
}
