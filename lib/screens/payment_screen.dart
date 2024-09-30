import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'delivery_progress_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                cardBgColor: Colors.orangeAccent,
                onCreditCardWidgetChange: (creditCardBrand) {
                  // ignore: avoid_print
                  print('Credit card brand changed to: $creditCardBrand');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CreditCardForm(
                formKey: formKey, 
                obscureCvv: true, 
                obscureNumber: true, 
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                cardHolderName: cardHolderName,
                expiryDate: expiryDate,
                onCreditCardModelChange: onCreditCardModelChange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: const Text('Pay now'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    _showConfirmationDialog(context);
                  } else {
                    // ignore: avoid_print
                    print('Invalid form');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Payment'),
          content: const Text('Are you sure you want to proceed with the payment?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                _navigateToDeliveryProgress(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToDeliveryProgress(BuildContext context) {
    // Simulate order and delivery details
    const orderId = '12345';
    const driverName = 'Wilson Okello';
    const driverPhone = '+254727480576';
    const estimatedDeliveryTime = '30 mins';
    final orderedItems = [
      {'name': 'Classic Burger', 'quantity':1 , 'price': 'Ksh 750'},
      {'name': 'Cola', 'quantity': 2, 'price': 'Ksh 300'},
    ];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeliveryProgressScreen(
          orderId: orderId,
          driverName: driverName,
          driverPhone: driverPhone,
          estimatedDeliveryTime: estimatedDeliveryTime,
          orderedItems: orderedItems,
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? model) {
    setState(() {
      cardNumber = model?.cardNumber ?? '';
      expiryDate = model?.expiryDate ?? '';
      cardHolderName = model?.cardHolderName ?? '';
      cvvCode = model?.cvvCode ?? '';
      isCvvFocused = model?.isCvvFocused ?? false;
    });
  }
}
