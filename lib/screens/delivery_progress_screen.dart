import 'package:flutter/material.dart';

class DeliveryProgressScreen extends StatelessWidget {
  final String orderId;
  final String driverName;
  final String driverPhone;
  final String estimatedDeliveryTime;
  final List<Map<String, dynamic>> orderedItems;

  const DeliveryProgressScreen({
    super.key,
    required this.orderId,
    required this.driverName,
    required this.driverPhone,
    required this.estimatedDeliveryTime,
    required this.orderedItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: $orderId',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Receipt',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildReceiptList(),
            const SizedBox(height: 16),
            Text(
              'Estimated Delivery Time: $estimatedDeliveryTime',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Driver: $driverName',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _callDriver(driverPhone);
                  },
                  child: const Text('Call Driver'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _messageDriver(driverPhone);
                  },
                  child: const Text('Message Driver'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptList() {
    return Column(
      children: orderedItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item['name'], style: const TextStyle(fontSize: 16)),
              Text('${item['quantity']} x ${item['price']}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _callDriver(String phoneNumber) {
    // Code to initiate a phone call
  }

  void _messageDriver(String phoneNumber) {
    // Code to send a message
  }
}
