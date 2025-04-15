import 'package:editable_table/kot_table.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    // Arrange
    final List<Map<String, String>> rows = [
      {'code': '106', 'name': 'Item 1'},
      {'code': '2', 'name': 'Item 2'},
      {'code': '3', 'name': 'Item 3'},
      {'code': '4', 'name': 'Item 4'},
    ];
    onUpdate(index, code, name) {
      // Mock update function
    }

    // Act
    final kotTableWidget = KotTableWidget(rows: rows, onUpdate: onUpdate);

    // Assert
    expect(kotTableWidget.rows.length, 4);
    expect(kotTableWidget.menuItems.length, 4);
  });
}
