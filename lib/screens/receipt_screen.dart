import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  final String orderId;
  final List<Map<String, dynamic>> orderedItems;
  final String estimatedDeliveryTime;
  final String driverName;
  final String driverPhone;

  const ReceiptScreen({
    super.key,
    required this.orderId,
    required this.orderedItems,
    required this.estimatedDeliveryTime,
    required this.driverName,
    required this.driverPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receipt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order ID: $orderId', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Ordered Items:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ...orderedItems.map((item) {
              return ListTile(
                title: Text(item['name']),
                subtitle: Text('Quantity: ${item['quantity']}'),
                trailing: Text('Price: ${item['price']}'),
              );
            }),
            const SizedBox(height: 20),
            Text('Estimated Delivery Time: $estimatedDeliveryTime', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            const Text('Driver Details:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Name: $driverName'),
            Text('Phone: $driverPhone'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.call),
                  label: const Text('Call Driver'),
                  onPressed: () {
                    // Handle call action here
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.message),
                  label: const Text('Message Driver'),
                  onPressed: () {
                    // Handle message action here
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
