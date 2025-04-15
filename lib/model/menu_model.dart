
class MenuItem {
  final String code;
  final String itemName;
  final String qty;
  final String rate;
  final String remarks;

  MenuItem({
    required this.code,
    required this.itemName,
    this.qty = '',
    this.rate = '',
    this.remarks = '',
  });

  factory MenuItem.fromCode(String code) {
    switch (code) {
      case '106':
        return MenuItem(code: '106', itemName: 'KFC', qty: '1', rate: '200', remarks: 'Spicy');
      case '2':
        return MenuItem(code: '2', itemName: 'Burger', qty: '2', rate: '150', remarks: '');
        case '3':
        return MenuItem(code: '3', itemName: 'Burger', qty: '2', rate: '150', remarks: 'spicy');
      case '4':
        return MenuItem(code: '4', itemName: 'Pasta', qty: '3', rate: '200', remarks: 'delicious');
      default:
        return MenuItem(code: code, itemName: '', qty: '', rate: '', remarks: '');
    }
  }

  Map<String, String> toMap() {
    return {
      "code": code,
      "itemName": itemName,
      "qty": qty,
      "rate": rate,
      "remarks": remarks,
    };
  }
}
