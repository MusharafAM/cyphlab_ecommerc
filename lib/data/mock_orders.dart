/// Simple static order model used only for the Profile/Orders screen.
/// This is intentionally separate from CartItem — per the task spec,
/// "static/mock data is enough" for the orders list.
class MockOrder {
  final String id;
  final String date;
  final int itemCount;
  final double total;
  final String status; // Delivered, Processing, Cancelled

  const MockOrder({
    required this.id,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
  });
}

final List<MockOrder> mockOrders = [
  const MockOrder(
    id: 'ORD-10231',
    date: '12 Jun 2026',
    itemCount: 3,
    total: 15990,
    status: 'Delivered',
  ),
  const MockOrder(
    id: 'ORD-10198',
    date: '02 Jun 2026',
    itemCount: 1,
    total: 4590,
    status: 'Delivered',
  ),
  const MockOrder(
    id: 'ORD-10122',
    date: '21 May 2026',
    itemCount: 2,
    total: 9980,
    status: 'Cancelled',
  ),
  const MockOrder(
    id: 'ORD-10076',
    date: '05 May 2026',
    itemCount: 4,
    total: 23460,
    status: 'Processing',
  ),
];
